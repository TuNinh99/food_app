import 'package:flutter/material.dart';
import 'package:food_app/utils/themes.dart';

class RatingStarGroup extends StatefulWidget {
  const RatingStarGroup({super.key});

  @override
  State<RatingStarGroup> createState() => RatingStarGroupState();
}

class RatingStarGroupState extends State<RatingStarGroup> {
  int _ratingNumer = 5;
  String _ratingText = 'Very good';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _ratingText,
          style: PrimaryFont.light(22).copyWith(
            color: kColorPrimary,
            height: 1,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        FittedBox(
          child: Row(
            children: [
              GestureDetector(
                onTap: () => setState(() {
                  _ratingNumer = 1;
                  _ratingText = 'Very bad';
                }),
                child: Icon(
                  _ratingNumer >= 1 ? Icons.star : Icons.star_border_outlined,
                  color: kColorYellow,
                  size: 35,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () => setState(() {
                  _ratingNumer = 2;
                  _ratingText = 'Bad';
                }),
                child: Icon(
                  _ratingNumer >= 2 ? Icons.star : Icons.star_border_outlined,
                  color: kColorYellow,
                  size: 35,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () => setState(() {
                  _ratingNumer = 3;
                  _ratingText = 'Normal';
                }),
                child: Icon(
                  _ratingNumer >= 3 ? Icons.star : Icons.star_border_outlined,
                  color: kColorYellow,
                  size: 35,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () => setState(() {
                  _ratingNumer = 4;
                  _ratingText = 'Good';
                }),
                child: Icon(
                  _ratingNumer >= 4 ? Icons.star : Icons.star_border_outlined,
                  color: kColorYellow,
                  size: 35,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () => setState(() {
                  _ratingNumer = 5;
                  _ratingText = 'Very good';
                }),
                child: Icon(
                  _ratingNumer >= 5 ? Icons.star : Icons.star_border_outlined,
                  color: kColorYellow,
                  size: 35,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        )
      ],
    );
  }
}
