import 'dart:async';

import 'package:event_calender/Provider/calender_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class EventCalender extends StatefulWidget {
  const EventCalender({super.key});

  @override
  State<EventCalender> createState() => _EventCalenderState();
}

class _EventCalenderState extends State<EventCalender> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CalenderProvider>(context,listen: false);
    Timer.periodic(Duration(seconds:0), (timer) {
      countProvider.setDefultDate();
    });

  }

  @override
  Widget build(BuildContext context) {
    print('building');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Calender"),
        centerTitle: true,
        elevation: double.infinity,
      ),
      body:ChangeNotifierProvider<CalenderProvider>(
       create: (context) => CalenderProvider(),
        child: Consumer<CalenderProvider>(
          builder: (context, value, child) {
            return Column(
              children: [
                TableCalendar(
                  focusedDay: value.dateTime,
                  firstDay: DateTime(2000),
                  lastDay: DateTime(2030),
                  onDaySelected: (selectedDay1, focusedDay) {
                    if(!isSameDay(value.selcteddate2, selectedDay1)){
                      value.setd(selectedDay1, focusedDay);
                    }
                  },
                  selectedDayPredicate: (day) {
                    return isSameDay(value.selcteddate2, day);
                  },
                )
              ],
            );
          },
        ),
      )
    );
  }
}
