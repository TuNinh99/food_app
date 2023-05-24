import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/utils/themes.dart';
import 'package:food_app/widgets/button_back.dart';
import 'package:food_app/widgets/rating_star_group.dart';

class RatingPage extends StatelessWidget {
  const RatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: size.height < 750 ? 4 : 3,
              child: Column(
                children: [
                  _HeaderAvatar(size: size),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Pizza Hut',
                    style: PrimaryFont.semiBold(20).copyWith(
                      color: kColorBlack,
                      height: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '4102  Pretty View Lanenda',
                    style: PrimaryFont.medium(13).copyWith(
                      color: const Color(0XFF9796A1),
                      height: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FittedBox(
                    child: Row(
                      children: [
                        Container(
                          width: 5,
                          height: 5,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(2.5),
                            ),
                            color: Color(0XFF53D776),
                          ),
                        ),
                        Text(
                          ' Order Delivered',
                          style: PrimaryFont.light(14).copyWith(
                            color: const Color(0XFF53D776),
                            height: 1,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: size.height < 750 ? 10 : 25,
                    ),
                    child: Text(
                      'Please Rate Delivery Service',
                      style: PrimaryFont.semiBold(18).copyWith(
                        color: const Color(0XFF111719),
                        height: 1,
                      ),
                    ),
                  ),
                  const RatingStarGroup(),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  _WriteReview(size: size),
                  SizedBox(
                    height: size.height < 750 ? 10 : 40,
                  ),
                  const _SubmitButton(),
                ],
              ),
            ),
          ],
        ),
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

class _WriteReview extends StatelessWidget {
  const _WriteReview({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.0775),
      height: size.height < 750 ? 120 : 168,
      child: TextFormField(
        //2 lines below to set height of textfield
        expands: true,
        maxLines: null,

        //set hintText of textfield on top
        textAlignVertical: TextAlignVertical.top,
        cursorColor: kColorYellow,
        decoration: InputDecoration(
          //set background color of text field
          filled: true,
          fillColor: kColorWhite,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,

          hintText: 'Write review',
          hintStyle: PrimaryFont.light(17).copyWith(
            color: const Color(0XFFC4C4C4),
            height: 1,
          ),

          contentPadding: const EdgeInsets.only(left: 22, top: 24),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 1,
              style: BorderStyle.solid,
              color: Color(0XFFEEEEEE),
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: kColorPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderAvatar extends StatelessWidget {
  const _HeaderAvatar({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            'assets/images/pizza_cover_2.png',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: (size.width * 0.0775 + 12),
            top: 10,
          ),
          child: const ButtonBack(),
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 100),
            child: CircleAvatar(
              backgroundColor: kColorWhite,
              radius: 52,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 82,
                    height: 82,
                    decoration: const BoxDecoration(
                      color: kColorYellow,
                      borderRadius: BorderRadius.all(Radius.circular(41)),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 14),
                          blurRadius: 36,
                          color: Color.fromRGBO(255, 197, 41, 0.3),
                        )
                      ],
                    ),
                    child: FractionallySizedBox(
                      widthFactor: 0.75,
                      heightFactor: 0.75,
                      child: Image.asset(
                        'assets/images/restaurants/logo/pizzahut.png',
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 11,
                    backgroundColor: kColorWhite,
                    child: CircleAvatar(
                      backgroundColor: kColorDrakGreen,
                      radius: 7.8,
                      child: SvgPicture.asset(
                        'assets/images/tick.svg',
                        width: 10,
                        height: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
