import 'package:flutter/material.dart';
import 'package:food_app/utils/themes.dart';

class FoodCover extends StatelessWidget {
  const FoodCover({
    super.key,
    required this.topLeftWidget,
    required this.image,
    required this.borderRadius,
  });

  final String image;
  final Widget topLeftWidget;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: borderRadius,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // RatingBox(ratingInfo: restaurant.ratingInfo),
              topLeftWidget,
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 7),
                      blurRadius: 15,
                      color: Color.fromRGBO(254, 114, 76, 0.4),
                    )
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: kColorPrimary,
                  radius: 14,
                  child: Image.asset('assets/images/ic_heart.png'),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
