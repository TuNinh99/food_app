// TextInputGroup
import 'package:flutter/material.dart';
import 'package:food_app/utils/common_define.dart';
import 'package:food_app/utils/themes.dart';

class TextInputGroup extends StatefulWidget {
  const TextInputGroup(
      {super.key,
      this.title = '',
      this.hintText = '',
      this.inputType = InputType.Normal});

  final String title;
  final String hintText;
  final InputType inputType;

  @override
  State<TextInputGroup> createState() => TextInputGroupState();
}

class TextInputGroupState extends State<TextInputGroup> {
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
            autofocus: true,
            focusNode: FocusNode(),
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
