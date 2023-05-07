import 'package:flutter/material.dart';
import 'package:food_app/data/models/ratingInfo.dart';
import 'package:food_app/utils/themes.dart';

class RatingBox extends StatelessWidget {
  const RatingBox({
    super.key,
    required this.ratingInfo,
  });

  final RatingInfo ratingInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 7.5),
      decoration: const BoxDecoration(
        color: kColorWhite,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5.8),
            blurRadius: 23,
            color: Color.fromRGBO(254, 114, 76, 0.2),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            ratingInfo.rate.toString(),
            style: PrimaryFont.semiBold(11.7)
                .copyWith(color: kColorBlack, height: 1.2),
          ),
          const Icon(
            Icons.star,
            color: kColorYellow,
            size: 15,
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            '(${ratingInfo.numberRate}+)',
            style: PrimaryFont.light(8.2).copyWith(
              color: const Color(0XFF9796A1),
            ),
          )
        ],
      ),
    );
  }
}
