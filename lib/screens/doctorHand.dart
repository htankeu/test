import 'package:bookmytime/screens/announcement_screen.dart';
import 'package:bookmytime/services/auth_services.dart';
import 'package:bookmytime/widgets/health_needs.dart';
import 'package:bookmytime/widgets/nearby_doctors.dart';
import 'package:bookmytime/widgets/search_bar.dart';
import 'package:bookmytime/widgets/upcoming_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorHand extends StatefulWidget {
const DoctorHand({ Key? key }) : super(key: key);

@override
State<DoctorHand> createState() => _doctorHand();
}

class _doctorHand extends State<DoctorHand>  {

void logOut (){
  // get auth-service

  final authService = Provider.of<AuthServices>(context,listen: false);

  authService.SignOut();
}


@override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            CustomizeSearchBar(height: 35,)
          ],
        ),
        actions: [
          IconButton(onPressed: ()=>{}, icon: const Icon(Icons.view_list)),
          IconButton(onPressed: logOut, icon: const Icon(Icons.logout_rounded))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 14, bottom: 14),
        children:  [
          // upcoming card
          const UpcomingCard(),
          const SizedBox(height:20),
          
          // Health needs
          const HealthNeeds(),
          const SizedBox(height:21),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Nearby Doctors",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          const SizedBox(height: 11,),
          // Nearby Doctors
          const NearbyDoctors(),
          const SizedBox(height:21),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Announcements",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          const SizedBox(height: 9,),
          // Announcements
          const AnnouncementScreen(),
          const SizedBox(height: 2,)
        ],
      ),
      
    );
  }
}