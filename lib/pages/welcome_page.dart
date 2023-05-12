import 'package:flutter/material.dart';
import 'package:food_app/utils/themes.dart';
import 'package:food_app/widgets/signin_buttonm_group.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          _SkipButton(size: size),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/welcome_bg.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color.fromRGBO(73, 79, 99, 0.17),
                  const Color(0XFF191B2F).withOpacity(0.9),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.0775),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(
                  flex: 2,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Welcome to ',
                          style: PrimaryFont.semiBold(53).copyWith(
                            color: const Color(0XFF111719),
                            height: size.height > 700 ? 1.28 : 1.1,
                            letterSpacing: 0.1,
                          ),
                          children: [
                            TextSpan(
                              text: 'FoodHub',
                              style: PrimaryFont.semiBold(45).copyWith(
                                color: kColorPrimary,
                                height: size.height > 700 ? 1.28 : 1.1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.8,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Your favourite foods delivered fast at your door.',
                          style: PrimaryFont.medium(18).copyWith(
                            color: const Color(0XFF30384F),
                            height: size.height > 700 ? 1.5 : 1.3,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      const SignInButtonGroup(),
                      const SizedBox(
                        height: 23,
                      ),
                      Container(
                        height: 54,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 0.21),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                          border: Border.all(
                            width: 1,
                            color: kColorWhite,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Start with email or phone',
                            style: PrimaryFont.medium(17).copyWith(
                              color: kColorWhite,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: PrimaryFont.light(16).copyWith(
                            color: kColorWhite,
                            height: 1,
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign In',
                              style: PrimaryFont.medium(16).copyWith(
                                color: kColorWhite,
                                height: 1,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    width: 134,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: kColorWhite,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SkipButton extends StatelessWidget {
  const _SkipButton({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: FractionallySizedBox(
        heightFactor: 0.6,
        child: Container(
          width: 55,
          height: 32,
          margin: EdgeInsets.only(right: size.width * 0.1),
          decoration: const BoxDecoration(
              color: kColorWhite,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(18, 18),
                  color: Color.fromRGBO(211, 209, 216, 0.25),
                )
              ]),
          child: Center(
            child: Text(
              'Skip',
              style: PrimaryFont.light(14).copyWith(
                color: kColorPrimary,
                height: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
