import 'package:bookmytime/models/doctor_model.dart';
import 'package:bookmytime/tools/pallete.dart';
import 'package:flutter/material.dart';

class NearbyDoctors extends StatelessWidget {
const NearbyDoctors({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      children: List.generate(nearbyDoctors.length, (index){
        return Padding(
          padding: const EdgeInsets.only(bottom:18),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image:  DecorationImage(
                    image: AssetImage(nearbyDoctors[index].profile) ,
                    // fit: BoxFit.
                    )
                ),
              ),
            const SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nearbyDoctors[index].name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 8,),
                Text(
                  nearbyDoctors[index].position
                ),
                const SizedBox(height:20,),
                Row(
                  children: [
                    const Icon(
                      Icons.star_purple500_outlined,
                      color: Pallete.goldColor,
                      size: 18,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:4, right: 6),
                      child: Text(
                        nearbyDoctors[index].averageReview.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Text(
                      "${nearbyDoctors[index].totalReviews} Reviews",
                      style: const TextStyle(
                        fontWeight: FontWeight.w100
                      ),
                      )
                  ],
                )
              ],
        
            )
            ],
          ),
        );
      }),
    );
  }
}