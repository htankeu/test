import 'package:bookmytime/models/announcement.dart';
import 'package:bookmytime/screens/custom_listing_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomCreateListingScreen extends StatefulWidget {
  final List<Announcement> announcements;
  const CustomCreateListingScreen({Key? key, required this.announcements})
      : super(key: key);

  @override
  _CustomCreateListingScreenState createState() =>
      _CustomCreateListingScreenState();
}

class _CustomCreateListingScreenState extends State<CustomCreateListingScreen> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  String location = '';
  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  void _submitForm() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState?.save();
        final newAnnouncement = Announcement(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: title,
          location: location,
          date: selectedDate,
          startTime: startTime ?? const TimeOfDay(hour: 0, minute: 0),
          endTime: endTime ?? const TimeOfDay(hour: 0, minute: 0),
          description: description,
          userId: _auth.currentUser?.uid ?? '',
        );

        DateTime startDateTime = DateTime(
            selectedDate!.year,
            selectedDate!.month,
            selectedDate!.day,
            newAnnouncement.startTime.hour,
            newAnnouncement.startTime.minute);
        DateTime endDateTime = DateTime(
            selectedDate!.year,
            selectedDate!.month,
            selectedDate!.day,
            newAnnouncement.endTime.hour,
            newAnnouncement.endTime.minute);

        FirebaseFirestore.instance.collection('announcements').add({
          'title': newAnnouncement.title,
          'location': newAnnouncement.location,
          'startDateTime': startDateTime,
          'endDateTime': endDateTime,
          'description': newAnnouncement.description,
          'userId': _auth.currentUser?.uid,
        }).then((_) {
          setState(() {
            widget.announcements.add(newAnnouncement);
          });

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Anzeige erstellt!'),
          ));

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CustomListingScreen(announcements: widget.announcements),
            ),
          );
        }).catchError((error) {
          print('Error adding announcement to Firestore: $error');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Fehler beim Erstellen der Anzeige: $error'),
            backgroundColor: Colors.red,
          ));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anzeige erstellen'),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Titel der Anzeige',
                    fillColor: Colors.blue,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Titel eingeben';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    title = value!;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Beschreibung der Aufgabe',
                    fillColor: Colors.blue,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Beschreibung eingeben';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    description = value!;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Ort',
                    fillColor: Colors.blue,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ort eingeben';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    location = value!;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Text(
                      "Datum der Aufgabe: ${selectedDate?.toLocal().toString().split(' ')[0] ?? 'Nicht ausgewählt'}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    TextButton.icon(
                      onPressed: () => _selectDate(context),
                      icon: const Icon(Icons.calendar_today),
                      label: const Text(""),
                      style: TextButton.styleFrom(
                        primary: Colors.blue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Text(
                      "Anfangszeit: ${startTime?.format(context) ?? 'Nicht eingegeben'}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 10.0),
                    TextButton.icon(
                      onPressed: () => _selectStartTime(context),
                      icon: const Icon(Icons.access_time),
                      label: const Text(""),
                      style: TextButton.styleFrom(primary: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Text(
                      "Endezeit: ${endTime?.format(context) ?? 'Nicht eingegeben'}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 10.0),
                    TextButton.icon(
                      onPressed: () => _selectEndTime(context),
                      icon: const Icon(Icons.access_time),
                      label: const Text(""),
                      style: TextButton.styleFrom(
                        primary: Colors.blue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    _submitForm();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomListingScreen(
                            announcements: widget.announcements),
                      ),
                    );
                  },
                  child: Text(
                    'Anzeige erstellen',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomListingScreen(
                            announcements: widget.announcements),
                      ),
                    );
                  },
                  child: Text(
                    'Anzeige sehen',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: CustomBottomNavigationBar(
      //   currentIndex: 0,
      //   onTap: (index) {
      //     if (index == 0) {
      //       print("Home");
      //     } else if (index == 1) {
      //       print("Nachrichten");
      //     } else if (index == 2) {
      //       print("Kalender");
      //     } else if (index == 3) {
      //       print("Konto");
      //     }
      //   },
      // ),
    );
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: startTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        startTime = picked;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: endTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        endTime = picked;
      });
    }
  }
}
