import 'package:bookmytime/customs/customCalendarDataSource.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DayViewScreen extends StatefulWidget {
  final DateTime selectedDate;
  final List<Appointment> dayEvents;
  const DayViewScreen({
    Key? key,
    required this.selectedDate,
    this.dayEvents = const <Appointment>[],
  }) : super(key: key);

  @override
  _DayViewScreenState createState() => _DayViewScreenState();
}

class _DayViewScreenState extends State<DayViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.selectedDate}"),
      ),
      body: SfCalendar(
        view: CalendarView.day,
        initialSelectedDate: widget.selectedDate,
        dataSource: CustomCalendarDataSource(widget.dayEvents),
      ),
    );
  }
}
