import 'package:bookmytime/customs/customCalendarDataSource.dart';
import 'package:bookmytime/screens/dayViewScreen.dart';
import 'package:bookmytime/tools/pallete.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TerminBuchung extends StatefulWidget {
  const TerminBuchung({Key? key}) : super(key: key);

  @override
  _TerminBuchungState createState() => _TerminBuchungState();
}

class _TerminBuchungState extends State<TerminBuchung> {
  List<Appointment> getAppointments() {
    List<Appointment> events = <Appointment>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));

    events.add(Appointment(
        startTime: startTime,
        endTime: endTime,
        subject: "Test",
        color: Pallete.goldColor));

    return events;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Terminvereinbarung",
            textAlign: TextAlign.center,
          ),
        ),
        body: SfCalendar(
          view: CalendarView.month,
          dataSource: CustomCalendarDataSource(getAppointments()),
          onTap: (CalendarTapDetails details) {
            // if the clicked element is an cell in the calendar
            if (details.targetElement == CalendarElement.calendarCell) {
              if (details.appointments!.isEmpty) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        DayViewScreen(selectedDate: details.date!)));
              } else {
                List<Appointment> appointments =
                    details.appointments!.map((dynamic item) {
                  return Appointment(
                      startTime: item.startTime,
                      endTime: item.endTime,
                      subject: item.subject,
                      color: item.color);
                }).toList();
                // change the view
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DayViewScreen(
                        selectedDate: details.date!, dayEvents: appointments)));
              }
            }
          },
        ));
  }
}
