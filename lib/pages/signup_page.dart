import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/utils/common_define.dart';
import 'package:food_app/utils/themes.dart';
import 'package:food_app/widgets/signin_buttonm_group.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColorWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('assets/images/topLeft_cover.svg'),
              SvgPicture.asset('assets/images/topRight_cover.svg'),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.0775),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign Up',
                  style: PrimaryFont.semiBold(36.5).copyWith(
                    color: kColorBlack,
                    height: 1.2,
                  ),
                ),
                SizedBox(
                  height: size.height > 800 ? 31 : 10,
                ),
                const _InputGroup(
                  title: 'Full name',
                  hintText: 'Your full name',
                ),
                SizedBox(
                  height: size.height > 800 ? 29 : 10,
                ),
                const _InputGroup(
                  title: 'E-mail',
                  hintText: 'Your email',
                  inputType: InputType.Email,
                ),
                SizedBox(
                  height: size.height > 800 ? 29 : 10,
                ),
                const _InputGroup(
                  title: 'Password',
                  hintText: 'Your password',
                  inputType: InputType.Password,
                ),
                SizedBox(
                  height: size.height > 800 ? 29 : 20,
                ),
                Center(
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
                ),
                SizedBox(
                  height: size.height > 800 ? 29 : 15,
                ),
                Center(
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
                ),
                // const Spacer(),
                SizedBox(
                  height: size.height > 800 ? 50 : 15,
                ),
                const SignInButtonGroup(
                  titleGroup: 'Sign up with',
                  textColor: Color(0XFF5B5B5E),
                  lineColor: Color.fromRGBO(179, 179, 179, 0.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InputGroup extends StatefulWidget {
  const _InputGroup(
      {this.title = '', this.hintText = '', this.inputType = InputType.Normal});

  final String title;
  final String hintText;
  final InputType inputType;

  @override
  State<_InputGroup> createState() => _InputGroupState();
}

class _InputGroupState extends State<_InputGroup> {
  bool _isHidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: PrimaryFont.medium(16).copyWith(
            color: const Color(0XFF9796A1),
            height: 1,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          decoration: const BoxDecoration(
            color: kColorWhite,
            boxShadow: [
              BoxShadow(
                offset: Offset(15, 20),
                blurRadius: 30,
                color: Color.fromRGBO(233, 233, 233, 0.25),
              ),
            ],
          ),
          child: TextFormField(
            keyboardType: widget.inputType == InputType.Email
                ? TextInputType.emailAddress
                : TextInputType.none,
            obscureText: widget.inputType == InputType.Password
                ? _isHidePassword
                : false,
            decoration: InputDecoration(
              hintText: widget.hintText,
              suffixIcon: widget.inputType == InputType.Password
                  ? IconButton(
                      onPressed: () => setState(() {
                        _isHidePassword = !_isHidePassword;
                      }),
                      icon: Icon(
                        _isHidePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color(0XFFD0D2D1),
                        size: 17,
                      ),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                    )
                  : null,
              hintStyle: PrimaryFont.medium(17).copyWith(
                color: const Color(0XFFC4C4C4),
                height: 1,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                  color: Color(0XFFEEEEEE),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: kColorPrimary,
                ),
              ),
              contentPadding: const EdgeInsets.only(
                left: 20,
                top: 25,
                bottom: 22,
              ),
            ),
            style: PrimaryFont.medium(17).copyWith(
              color: const Color(0XFF111719),
              height: 1,
            ),
          ),
        ),
      ],
    );
  }
}
