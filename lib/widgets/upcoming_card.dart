import 'package:bookmytime/tools/pallete.dart';
import 'package:flutter/material.dart';

class UpcomingCard extends StatelessWidget {
const UpcomingCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.symmetric(
        vertical: 22,
        horizontal: 20
      ),
      decoration: BoxDecoration(
        color: Pallete.primary_op,
        borderRadius:BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/doctor_1.png",
              width: 75,)
            ),
          const SizedBox(width: 15,),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 7),
                child: Text("Dr. Pougala Paul", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Pallete.whiteColor
                  ),
                ),
              ),
              const Text(
                "Dental Specialist",
                style: TextStyle(
                  color: Pallete.whiteColor
                ),
              ),
              const SizedBox(height:18),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Pallete.transpWhite,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Row(
                  children: [
                    Icon(Icons.calendar_month_outlined, size: 18, color: Pallete.whiteColor,),
                    Padding(
                      padding: EdgeInsets.only(left: 7, right: 15),
                      child: Text(
                        "Today",
                        style: TextStyle(
                          color: Pallete.whiteColor
                        ),
                      ),
                    ),
                    Icon(Icons.access_time_filled_rounded, size: 18, color: Pallete.whiteColor,),
                    Padding(
                      padding: EdgeInsets.only(left: 7, right: 15),
                      child: Text(
                        "14:30 - 15:00 AM",
                        style: TextStyle(
                          color: Pallete.whiteColor
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}