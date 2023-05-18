import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/widgets/button_back.dart';

class HeaderSignPages extends StatelessWidget {
  const HeaderSignPages({
    super.key,
    required this.size,
    this.isVisibleBackButton = false,
  });

  final Size size;
  final bool isVisibleBackButton;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset('assets/images/topLeft_cover.svg'),
            SvgPicture.asset('assets/images/topRight_cover.svg'),
          ],
        ),
        Visibility(
          visible: isVisibleBackButton,
          child: Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.0775, top: size.width * 0.08),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const ButtonBack(),
            ),
          ),
        ),
      ],
    );
  }
}
