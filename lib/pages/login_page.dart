import 'package:flutter/material.dart';
import 'package:food_app/utils/common_define.dart';
import 'package:food_app/utils/themes.dart';
import 'package:food_app/widgets/header_sign_pages.dart';
import 'package:food_app/widgets/signin_button_group.dart';
import 'package:food_app/widgets/text_input_group.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderSignPages(
            size: size,
            isVisibleBackButton: true,
          ),
          const Spacer(),
          Expanded(
            flex: 8,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.0775),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'Login',
                      style: PrimaryFont.semiBold(36.5).copyWith(
                        color: kColorBlack,
                        height: 1.2,
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: TextInputGroup(
                      title: 'E-mail',
                      hintText: 'Your email or phone',
                      inputType: InputType.Email,
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: TextInputGroup(
                      title: 'Password',
                      hintText: 'Password',
                      inputType: InputType.Password,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Forgot password?',
                        style: PrimaryFont.medium(14).copyWith(
                          color: kColorPrimary,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(child: _LoginButton()),
                  const Expanded(child: _QuestionText()),
                  const Spacer(),
                  const Expanded(
                    flex: 2,
                    child: SignInButtonGroup(
                      titleGroup: 'Sign in with',
                      lineColor: Color.fromRGBO(179, 179, 179, 0.5),
                      textColor: Color(0XFF5B5B5E),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
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
          text: 'Don’t have an account? ',
          style: PrimaryFont.medium(14).copyWith(
            color: const Color(0XFF5B5B5E),
            height: 1,
          ),
          children: [
            TextSpan(
              text: 'Sign Up',
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

class _LoginButton extends StatelessWidget {
  const _LoginButton();

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
            'LOGIN',
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
