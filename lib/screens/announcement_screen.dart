import 'package:bookmytime/services/announcement/announcement_service.dart';
import 'package:bookmytime/widgets/announce_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({Key? key}) : super(key: key);

  @override
  _AnnouncementScreenState createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  final AnnouncementService _announcementService = new AnnouncementService();

  @override
  Widget build(BuildContext context) {
    return _buildAnnouceList();
  }

  Widget _buildAnnouceList() {
    return FutureBuilder(
        future: _announcementService.getAnnouncement(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error ${snapshot.error}');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("Any data are available"),
            );
          } else {
            return _buildAnnounceElement(snapshot);
          }
        });
  }

  Widget _buildAnnounceElement(
      AsyncSnapshot<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
          snapshot) {
    if (snapshot.hasData && !snapshot.hasError) {
      // Accessing the list of snapshots
      List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshotList =
          snapshot.data!;

      // Iterating through the list
      return GridView.count(
        crossAxisCount: 2,
        children: snapshotList.map((doc) => _buildAnnounceItem(doc)).toList(),
      );
    } else {
      return Text('Error : ${snapshot.error}');
    }
  }

  Widget _buildAnnounceItem(QueryDocumentSnapshot<Map<String, dynamic>> data) {
    Map<String, dynamic> dataUsed = data.data();
    String location = dataUsed['location'];
    String description = dataUsed['title'];

    return Padding(
      padding: const EdgeInsets.all(8),
      child: AnnounceCard(description: description, location: location),
    );
  }
}
