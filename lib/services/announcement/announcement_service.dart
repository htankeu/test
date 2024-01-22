import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AnnouncementService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  // GET ANNOUNCEMENT
  Future<Iterable<Map<String, dynamic>>>getAnnouncement() async {
    var snapshot = await _firestore.collection('announcement').get();

    return snapshot.docs.map((doc) => doc.data());
  }
}