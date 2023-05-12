import 'package:flutter/material.dart';
import 'package:food_app/utils/common_define.dart';
import 'package:food_app/utils/themes.dart';
import 'package:food_app/widgets/dismiss_keyboard.dart';
import 'package:food_app/widgets/header_sign_pages.dart';
import 'package:food_app/widgets/scrolling_when_keyboard_appear.dart';
import 'package:food_app/widgets/text_input_field.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage(
      {super.key, this.verifyEmail = 'prelookstudio@gmail.com'});

  final String verifyEmail;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: DismissKeyboard(
        child: ScrollingWhenKeyboardAppear(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderSignPages(
                size: size,
                isVisibleBackButton: true,
              ),
              Expanded(
                flex: 10,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: size.width * 0.0775),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(
                        flex: 2,
                      ),
                      Expanded(
                        flex: 4,
                        child: _MainContent(verifyEmail: verifyEmail),
                      ),
                      const Spacer(
                        flex: 4,
                      ),
                    ],
                  ),
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
    required this.verifyEmail,
  });

  final String verifyEmail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Verification Code',
          style: PrimaryFont.semiBold(36.5).copyWith(
            color: kColorBlack,
            height: 1.2,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          'Please type the verification code sent to $verifyEmail',
          style: PrimaryFont.medium(14).copyWith(
            color: const Color(0XFF9796A1),
            height: 1.3,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 65,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Expanded(
                flex: 3,
                child: TextInputField(inputType: InputType.Code),
              ),
              Spacer(),
              Expanded(
                flex: 3,
                child: TextInputField(inputType: InputType.Code),
              ),
              Spacer(),
              Expanded(
                flex: 3,
                child: TextInputField(inputType: InputType.Code),
              ),
              Spacer(),
              Expanded(
                flex: 3,
                child: TextInputField(inputType: InputType.Code),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Center(
          child: RichText(
            text: TextSpan(
              text: 'I don’t recevie a code! ',
              style: PrimaryFont.medium(16).copyWith(
                color: const Color(0XFF5B5B5E),
                height: 1,
              ),
              children: [
                TextSpan(
                  text: 'Please resend',
                  style: PrimaryFont.medium(16).copyWith(
                    color: kColorPrimary,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
