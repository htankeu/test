import 'package:flutter/material.dart';

class Announcement {
  final String id; 
  final String title;
  final String location;
  final DateTime? date;
  final String description;
  final TimeOfDay startTime;
  final TimeOfDay endTime;  
  String userId;

  Announcement({
    required this.id,
    required this.title,
    required this.location,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.description,
    required this.userId,
  });
}