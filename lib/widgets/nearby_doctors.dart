import 'package:bookmytime/models/doctor_model.dart';
import 'package:bookmytime/tools/pallete.dart';
import 'package:flutter/material.dart';

class NearbyDoctors extends StatefulWidget {
  const NearbyDoctors({Key? key}) : super(key: key);

  @override
  _nearbyDoctors createState() => _nearbyDoctors();
}

class _nearbyDoctors extends State<NearbyDoctors> with TickerProviderStateMixin {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: SizedBox(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              itemCount: nearbyDoctors.length,
              physics: BouncingScrollPhysics(),
              controller: PageController(initialPage: 3, viewportFraction: 0.7),
              onPageChanged: (value) {
                currentIndex = value;
                setState(() {});
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Pallete.gradient2,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 50,
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(nearbyDoctors[index].profile),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nearbyDoctors[index].name,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(nearbyDoctors[index].position),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star_purple500_outlined,
                                  color: Pallete.goldColor,
                                  size: 18,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 4, right: 6),
                                  child: Text(
                                    nearbyDoctors[index].averageReview.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  "${nearbyDoctors[index].totalReviews} Reviews",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w100),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        TabPageSelector(
          controller: TabController(
            length: nearbyDoctors.length,
            initialIndex: currentIndex,
            vsync: this,
          ),
        )
      ],
    );
  }
}
