import 'package:flutter/material.dart';
import 'package:food_app/data/models/foods.dart';
import 'package:food_app/utils/themes.dart';
import 'package:food_app/widgets/food_cover.dart';
import 'package:food_app/widgets/rating_box.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({
    super.key,
    required this.size,
    required this.item,
  });

  final Size size;
  final Food item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.only(bottom: 20),
      height: size.width > 600 ? 400 : 250,
      decoration: const BoxDecoration(
        color: kColorWhite,
        borderRadius: BorderRadius.all(
          Radius.circular(18.2),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(18.2, 18.2),
            blurRadius: 36.4,
            color: Color.fromRGBO(211, 209, 216, 0.25),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 7,
            child: FoodCover(
              topLeftWidget: Container(
                width: 72,
                height: 34,
                decoration: const BoxDecoration(
                  color: kColorWhite,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 7),
                        blurRadius: 28,
                        color: Color.fromRGBO(254, 114, 76, 0.2)),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(36),
                  ),
                ),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: '\$',
                      style: PrimaryFont.semiBold(18).copyWith(
                        color: kColorPrimary,
                        height: 1,
                      ),
                      children: [
                        TextSpan(
                          text: item.price.toStringAsFixed(2),
                          style: PrimaryFont.semiBold(18).copyWith(
                            color: const Color(0XFF111719),
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              bottomLeftWidget: RatingBox(ratingInfo: item.ratingInfo),
              image: item.image,
              borderRadius: const BorderRadius.all(
                Radius.circular(18),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Expanded(
                    child: Text(
                      item.name,
                      style: PrimaryFont.semiBold(18.2).copyWith(
                        color: kColorBlack,
                        height: 1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item.shortDescription,
                      style: PrimaryFont.medium(14).copyWith(
                        color: const Color(0XFF5B5B5E),
                        height: 1.05,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
