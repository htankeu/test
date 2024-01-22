import 'package:clean_calendar/clean_calendar.dart';
import 'package:flutter/material.dart';

class AddOrSeeAppointment extends StatefulWidget {
  const AddOrSeeAppointment({ Key? key }) : super(key: key);

  @override
  _AddOrSeeAppointmentState createState() => _AddOrSeeAppointmentState();
}

class _AddOrSeeAppointmentState extends State<AddOrSeeAppointment> {

  DateTime today = DateTime.now();
  // late List<CleanCalendar> selectedEvent;
  // final Map<DateTime,List<CleanCalendar>> events = {
  //   DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day):
  //   [
  //     CleanCalendar(

  //     )
  //   ]
  // };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Appointments'),elevation: 2,),
      body: CleanCalendar(
        currentDateOfCalendar: today,
      ),
      
    );
  }
}