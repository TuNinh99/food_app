import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/utils/themes.dart';

class SignInButtonGroup extends StatelessWidget {
  const SignInButtonGroup({
    super.key,
    this.titleGroup = '',
    this.textColor = kColorWhite,
    this.distance = 18,
    this.lineColor = kColorWhite,
  });

  final String titleGroup;
  final Color textColor;
  final double distance;
  final Color lineColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleGroup(
          title: titleGroup,
          textColor: textColor,
          lineColor: lineColor,
        ),
        SizedBox(
          height: distance,
        ),
        Row(
          children: const [
            Expanded(
              flex: 3,
              child: _SignInButton(
                title: 'FACEBOOK',
                svgIcon: 'assets/images/icons/ic_facebook.svg',
              ),
            ),
            Spacer(),
            Expanded(
              flex: 3,
              child: _SignInButton(
                title: 'GOOGLE',
                svgIcon: 'assets/images/icons/ic_google.svg',
              ),
            )
          ],
        ),
      ],
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({required this.title, required this.svgIcon});

  final String svgIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(27),
        ),
        color: kColorWhite,
        boxShadow: [
          BoxShadow(
            offset: Offset(18, 18),
            blurRadius: 36,
            color: Color.fromRGBO(211, 209, 216, 0.25),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(svgIcon),
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: PrimaryFont.medium(13)
                .copyWith(color: kColorBlack, height: 1, letterSpacing: 0.2),
          ),
        ],
      ),
    );
  }
}

class TitleGroup extends StatelessWidget {
  const TitleGroup({
    super.key,
    required this.textColor,
    required this.title,
    this.lineColor = kColorWhite,
  });

  final String title;
  final Color textColor;
  final Color lineColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: lineColor,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              title,
              style: PrimaryFont.medium(16).copyWith(
                color: textColor,
                height: 1,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: lineColor,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
