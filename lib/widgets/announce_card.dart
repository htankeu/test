import 'package:bookmytime/tools/pallete.dart';
import 'package:flutter/material.dart';

class AnnounceCard extends StatefulWidget {
  final double width;
  final double height;
  final Color color;
  final Color shadowColor;
  final String image;
  final double imageHeight;
  final String location;
  final String description;
  const AnnounceCard({
    Key? key,
    this.width = 200,
    this.height = 265,
    this.color = Pallete.whiteColor,
    this.shadowColor = Pallete.kGreyColor,
    this.image = '',
    this.imageHeight = 100,
    required this.location,
    required this.description,
  }) : super(key: key);

  @override
  _AnnounceCardState createState() => _AnnounceCardState();
}

class _AnnounceCardState extends State<AnnounceCard> {
  // to control with change icon color
  bool _isFavorited = false;
  // to determine the starting point number
  int _favoriteCount = 0;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: widget.shadowColor,
                spreadRadius: 3,
                blurRadius: 10,
                offset: Offset(0, 3))
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              child: Image.asset(
                widget.image,
                height: widget.imageHeight,
              ),
            ),
            Text(widget.location,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: AutofillHints.addressCity,
                  fontWeight: FontWeight.w200,
                ),
                textAlign: TextAlign.center),
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Text(
                  widget.description,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  width: 2,
                ),
                Container(
                  padding: const EdgeInsets.all(0),
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    alignment: Alignment.centerRight,
                    icon: (_isFavorited
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border)),
                    color: Colors.red[500],
                    onPressed: _toggleFavorite,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
