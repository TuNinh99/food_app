import 'package:flutter/material.dart';
import 'package:food_app/utils/common_define.dart';
import 'package:food_app/utils/themes.dart';
import 'package:food_app/widgets/dismiss_keyboard.dart';
import 'package:food_app/widgets/header_sign_pages.dart';
import 'package:food_app/widgets/scrolling_when_keyboard_appear.dart';
import 'package:food_app/widgets/signin_button_group.dart';
import 'package:food_app/widgets/text_input_group.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColorWhite,
      // resizeToAvoidBottomInset: false,
      body: DismissKeyboard(
        child: ScrollingWhenKeyboardAppear(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderSignPages(size: size),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 10,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: size.width * 0.0775),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Sign Up',
                          style: PrimaryFont.semiBold(36.5).copyWith(
                            color: kColorBlack,
                            height: 1.2,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: size.height > 800,
                        child: const Spacer(),
                      ),
                      const Expanded(
                        flex: 2,
                        child: TextInputGroup(
                          title: 'Full name',
                          hintText: 'Your full name',
                        ),
                      ),
                      const Expanded(
                        flex: 2,
                        child: TextInputGroup(
                          title: 'E-mail',
                          hintText: 'Your email',
                          inputType: InputType.Email,
                        ),
                      ),
                      const Expanded(
                        flex: 2,
                        child: TextInputGroup(
                          title: 'Password',
                          hintText: 'Your password',
                          inputType: InputType.Password,
                        ),
                      ),
                      const Expanded(child: _SignInButton()),
                      const Expanded(child: _QuestionText()),
                      // const Spacer(),
                      const Expanded(
                        flex: 2,
                        child: SignInButtonGroup(
                          titleGroup: 'Sign up with',
                          textColor: Color(0XFF5B5B5E),
                          lineColor: Color.fromRGBO(179, 179, 179, 0.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuestionText extends StatelessWidget {
  const _QuestionText();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Already have an account? ',
          style: PrimaryFont.medium(14).copyWith(
            color: const Color(0XFF5B5B5E),
            height: 1,
          ),
          children: [
            TextSpan(
              text: 'Login',
              style: PrimaryFont.medium(14).copyWith(
                color: kColorPrimary,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton();

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
            'SIGN UP',
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
