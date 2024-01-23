import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AnnouncementService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  // GET ANNOUNCEMENT
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>getAnnouncement() {
    var snapshot = _firestore.collection('announcements').get();

    return snapshot.then((value) => value.docs);
  }
}