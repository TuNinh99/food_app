import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/pages/welcome_page.dart';
import 'package:food_app/utils/themes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColorPrimary,
      body: GestureDetector(
        onHorizontalDragEnd: (dragEndDetails) {
          debugPrint('Swipe to welcome page');
          Navigator.pushNamed(context, '$WelcomePage');
        },
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SvgPicture.asset('assets/images/logo.svg'),
              ),
            ),
            Container(
              width: 134,
              height: 5,
              margin: EdgeInsets.only(bottom: size.width * 0.05),
              decoration: const BoxDecoration(
                color: kColorWhite,
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
