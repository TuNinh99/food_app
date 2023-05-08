import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/data/models/foods.dart';
import 'package:food_app/utils/themes.dart';
import 'package:food_app/widgets/button_back.dart';
import 'package:food_app/widgets/food_cover.dart';
import 'package:food_app/widgets/rating_box.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          _Header(size: size),
          _ShortBy(
            size: size,
          ),
          const SizedBox(
            height: 24,
          ),
          _FilterList(size: size),
        ],
      ),
    );
  }
}

class _FilterList extends StatelessWidget {
  const _FilterList({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.0775),
      child: Column(
        children: List.generate(popularItems.length, (index) {
          var item = popularItems[index];
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
        }),
      ),
    );
  }
}

class _ShortBy extends StatelessWidget {
  const _ShortBy({required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.0775),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  'Short by: ',
                  style: PrimaryFont.medium(14).copyWith(
                    color: const Color(0XFF111719),
                    height: 1,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Popular ',
                  style: PrimaryFont.medium(14).copyWith(
                    color: kColorPrimary,
                    height: 1,
                  ),
                ),
                SvgPicture.asset('assets/images/arrow_down.svg'),
              ],
            ),
          ),
          Image.asset('assets/images/ic_double_switch.png'),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height < 650 ? size.height * 0.35 : size.height * 0.3,
      margin: EdgeInsets.only(
        left: size.width * 0.0775,
        right: size.width > 600 ? size.width * 0.125 : size.width * 0.135,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const ButtonBack(),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Fast',
                  style: PrimaryFont.semiBold(38).copyWith(
                    color: const Color(0XFF272D2F),
                    height: 1.1,
                  ),
                ),
                Text(
                  'Food',
                  style: PrimaryFont.semiBold(45).copyWith(
                    color: kColorPrimary,
                    height: 1.1,
                  ),
                ),
                Text(
                  '80 type of pizza',
                  style: PrimaryFont.light(19).copyWith(
                    color: const Color(0XFF9796A1),
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Transform.scale(
              // scaleY: 1.52,
              // scaleX: 1.8,
              scale: 1.9,
              child: Image.asset('assets/images/pizza_cover.png'),
            ),
          ),
        ],
      ),
    );
  }
}
