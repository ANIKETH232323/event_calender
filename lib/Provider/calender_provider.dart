import 'package:flutter/foundation.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderProvider with ChangeNotifier{

  CalendarFormat calendarFormat = CalendarFormat.month;

  DateTime _dateTime  = DateTime.now();

  DateTime? _selcteddate;

  DateTime get dateTime => _dateTime;

  DateTime? get selcteddate2 => _selcteddate;

  void setDefultDate(){
    _selcteddate = _dateTime;
    notifyListeners();
  }

  void setd(select,sel){
    _selcteddate = select;
    _dateTime =sel;
    notifyListeners();
  }

}