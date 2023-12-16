import 'package:bookmytime/tools/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HealthNeeds extends StatelessWidget {
const HealthNeeds({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){

    List<CustomIcon> CustomIcons = [
      CustomIcon(icon: "assets/images/kits_medical.png", name: "Appointement"),
      CustomIcon(icon: "assets/images/help.png", name: "Helping someone"),
      CustomIcon(icon: "assets/images/asking_help.png", name: "Ask for help"),
      CustomIcon(icon: "assets/images/others.png", name: "Other categories"),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(CustomIcons.length, (index){
        return Column(
          children: [
            Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(10),
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color: Pallete.kWhiteColor,
              ),
              child: Image.asset(CustomIcons[index].icon),
            ),
            const SizedBox(height: 6,),
             Text(CustomIcons[index].name),
          ],
        );
      }),
    );
  }
}


class CustomIcon {
  final String icon;
  final String name;
  CustomIcon({
    required this.icon,
    required this.name
  });
}