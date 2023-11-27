import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HealthNeeds extends StatelessWidget {
const HealthNeeds({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){

    List<CustomIcon> CustomIcons = [
      CustomIcon(icon: "assets/images/kits_medical.png", name: "Appointement"),
      CustomIcon(icon: "assets/images/pharmacie.png", name: "Pharmacy"),
      CustomIcon(icon: "assets/images/examine.png", name: "Examination"),
      CustomIcon(icon: "assets/images/ambulace.png", name: "Ambulance"),
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
                color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.4),
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