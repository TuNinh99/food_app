import 'package:flutter/material.dart';
import 'package:food_app/utils/themes.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: const BoxDecoration(
        color: kColorWhite,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(5, 10),
            blurRadius: 20,
            color: Color.fromRGBO(211, 209, 216, 0.3),
          ),
        ],
      ),
      child: const Icon(
        Icons.arrow_back_ios_new_rounded,
        size: 12,
        color: Color(0XFF111719),
      ),
    );
  }
}
