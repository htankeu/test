import 'package:bookmytime/services/announcement/announcement_service.dart';
import 'package:bookmytime/widgets/announce_card.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("The available activities in moment"),
      ),
      body: Column(
        children: [_buildAnnouceList()],
      ),
    );
  }

  Widget _buildAnnouceList() {
    return FutureBuilder(
        future: _announcementService.getAnnouncement(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading....");
          }

          return GridView.count(
            crossAxisCount: 2,
            children: [_buildAnnounceItem(snapshot.data!)],
          );
        });
  }

  Widget _buildAnnounceItem(Iterable<Map<String, dynamic>> data) {
    Map<String, dynamic> dataUsed = data as Map<String, dynamic>;
    String location = dataUsed['location'];
    String description = dataUsed['title'];

    return Padding(
      padding: const EdgeInsets.all(8),
      child: AnnounceCard(description: description, location: location),
    );
  }
}
