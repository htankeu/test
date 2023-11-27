import 'package:bookmytime/services/auth_services.dart';
import 'package:bookmytime/widgets/health_needs.dart';
import 'package:bookmytime/widgets/nearby_doctors.dart';
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
            Text("Hi, Joel"),
            Text(
              "How are you feeling today?",
              style: TextStyle(
                fontStyle: FontStyle.italic
              ))
          ],
        ),
        actions: [
          IconButton(onPressed: ()=>{}, icon: const Icon(Icons.view_list)),
          IconButton(onPressed: ()=>{}, icon: const Icon(Icons.search_outlined)),
          IconButton(onPressed: logOut, icon: const Icon(Icons.logout_rounded))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(14),
        children:  [
          // upcoming card
          const UpcomingCard(),
          const SizedBox(height:20),
          Text(
            "Health Needs",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height:18),

          // Health needs
          const HealthNeeds(),
          const SizedBox(height:30),
          Text(
            "Nearby Doctors",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 15,),

          // Nearby Doctors
          const NearbyDoctors()
        ],
      ),
      
    );
  }
}