import 'package:flutter/material.dart';
import 'package:food_app/utils/common_define.dart';
import 'package:food_app/utils/themes.dart';
import 'package:food_app/widgets/dismiss_keyboard.dart';
import 'package:food_app/widgets/header_sign_pages.dart';
import 'package:food_app/widgets/scrolling_when_keyboard_appear.dart';
import 'package:food_app/widgets/text_input_field.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: DismissKeyboard(
        child: ScrollingWhenKeyboardAppear(
          child: Column(
            children: [
              HeaderSignPages(
                size: size,
                isVisibleBackButton: true,
              ),
              Expanded(
                flex: 10,
                child: Column(
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    Expanded(
                      flex: 6,
                      child: _MainContent(size: size),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.0775,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Resset Password',
            style: PrimaryFont.semiBold(36.5).copyWith(
              color: kColorBlack,
              height: 1.2,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            'Please enter your email address to request a password reset',
            style: PrimaryFont.medium(14).copyWith(
              color: const Color(0XFF9796A1),
              height: 1.3,
            ),
          ),
          const SizedBox(
            height: 38,
          ),
          const TextInputField(
            inputType: InputType.Email,
            hintText: 'E-mail receive new password',
          ),
          const SizedBox(
            height: 50,
          ),
          const _ButtonSend()
        ],
      ),
    );
  }
}

class _ButtonSend extends StatelessWidget {
  const _ButtonSend();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        width: 248,
        decoration: const BoxDecoration(
          color: kColorPrimary,
          borderRadius: BorderRadius.all(
            Radius.circular(28.5),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 40,
              color: Color.fromRGBO(122, 129, 190, 0.16),
            )
          ],
        ),
        child: Center(
          child: Text(
            'SEND NEW PASSWORD',
            style: PrimaryFont.medium(15).copyWith(
              color: kColorWhite,
              height: 1,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}
