import 'package:flutter/material.dart';
import 'package:food_app/utils/themes.dart';
import 'package:food_app/widgets/header_bar.dart';
import 'package:food_app/widgets/rating_star_group.dart';

class ReviewRestaurantPage extends StatelessWidget {
  const ReviewRestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: HeaderBar(
        size: size,
        pageName: '',
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.0775),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: size.height > 750,
                child: const Spacer(),
              ),
              Expanded(
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          color: kColorWhite,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(14, 21),
                              blurRadius: 28,
                              color: Color.fromRGBO(211, 209, 216, 0.45),
                            ),
                          ],
                        ),
                        child: FractionallySizedBox(
                          widthFactor: 0.7,
                          heightFactor: 0.7,
                          child: Image.asset(
                            'assets/images/restaurants/logo/pizzahut.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: size.height > 750,
                child: const Spacer(),
              ),
              Visibility(
                visible: size.height < 750,
                child: const SizedBox(
                  height: 20,
                ),
              ),
              Expanded(
                child: Text(
                  'How was your last order from Pizza Hut ?',
                  style:
                      PrimaryFont.light(size.height < 700 ? 28 : 31).copyWith(
                    color: kColorBlack,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Expanded(child: RatingStarGroup()),
              Visibility(
                visible: size.height > 750,
                child: const Spacer(),
              ),
              const Expanded(
                child: _WriteShortReview(),
              ),
              Spacer(
                flex: size.height < 750 ? 1 : 2,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 33),
                child: const _SubmitButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WriteShortReview extends StatelessWidget {
  const _WriteShortReview();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kColorYellow,
      decoration: InputDecoration(
        hintText: 'Write',
        hintStyle: PrimaryFont.light(16).copyWith(
          color: const Color.fromRGBO(0, 0, 0, 0.2),
          height: 1,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: Color(0XFFEEEEEE),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: kColorPrimary,
          ),
        ),
      ),
      style: PrimaryFont.medium(17).copyWith(
        color: const Color(0XFF111719),
        height: 1,
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 248,
      height: 60,
      decoration: const BoxDecoration(
          color: kColorPrimary,
          borderRadius: BorderRadius.all(Radius.circular(28.5)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 20),
              blurRadius: 30,
              color: Color.fromRGBO(254, 114, 76, 0.251),
            ),
          ]),
      child: Center(
        child: Text(
          'SUBMIT',
          style: PrimaryFont.medium(15).copyWith(
            color: kColorWhite,
            height: 1,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
