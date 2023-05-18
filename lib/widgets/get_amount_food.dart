import 'package:flutter/material.dart';

import '../utils/themes.dart';

class GetAmountOfFood extends StatefulWidget {
  const GetAmountOfFood({super.key});

  @override
  State<GetAmountOfFood> createState() => _GetAmountOfFoodState();
}

class _GetAmountOfFoodState extends State<GetAmountOfFood> {
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => setState(() {
            amount > 1 ? amount-- : amount = 1;
          }),
          child: Container(
            width: 29,
            height: 29,
            decoration: BoxDecoration(
                color: kColorWhite,
                border: Border.all(
                  color: kColorPrimary,
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(17),
                ),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 20),
                    blurRadius: 30,
                    color: Color(0XFFEEF0F2),
                  )
                ]),
            child: const Icon(
              Icons.remove,
              color: kColorPrimary,
              size: 15.0,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              amount < 10 ? ('0${amount.toString()}') : amount.toString(),
              style: PrimaryFont.semiBold(16).copyWith(
                color: kColorBlack,
                height: 1,
                letterSpacing: 0.25,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => setState(() {
            amount++;
          }),
          child: Container(
            width: 29,
            height: 29,
            decoration: BoxDecoration(
              color: kColorPrimary,
              border: Border.all(
                color: kColorPrimary,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(17),
              ),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 7),
                  blurRadius: 15,
                  color: Color.fromRGBO(254, 114, 76, 0.4),
                ),
              ],
            ),
            child: const Icon(
              Icons.add,
              color: kColorWhite,
              size: 15.0,
            ),
          ),
        ),
      ],
    );
  }
}
