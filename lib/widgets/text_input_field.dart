import 'package:flutter/material.dart';
import 'package:food_app/utils/common_define.dart';

import '../utils/themes.dart';

class TextInputField extends StatefulWidget {
  const TextInputField({
    super.key,
    required this.inputType,
    this.hintText = '',
  });

  final InputType inputType;
  final String hintText;

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  bool _isHidePassword = true;

  TextInputType setKeyboardType(InputType inputType) {
    switch (inputType) {
      case InputType.Code:
      case InputType.Number:
        return TextInputType.number;
      case InputType.Email:
        return TextInputType.emailAddress;
      case InputType.Password:
        return TextInputType.visiblePassword;
      case InputType.Phone:
        return TextInputType.phone;
      case InputType.Address:
        return TextInputType.streetAddress;
      default:
        return TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //set keyboard type when pess to enter text to text field
      keyboardType: setKeyboardType(widget.inputType),

      //TextInputAction.next => move the cursor to the next field
      //TextInputAction.done => close the key board
      textInputAction: TextInputAction.next,

      //property for cursor
      cursorColor: kColorYellow,

      autofocus: true,
      // focusNode: FocusNode(),

      //Set position of text input is center of text field
      textAlign: widget.inputType == InputType.Code
          ? TextAlign.center
          : TextAlign.left,

      //Set max length character of text field
      maxLength: widget.inputType == InputType.Code ? 1 : null,

      obscureText:
          widget.inputType == InputType.Password ? _isHidePassword : false,

      decoration: InputDecoration(
        //hide counter when set maxlength
        counter: const Offstage(),

        //set background color of text field
        filled: true,
        fillColor: kColorWhite,
        focusColor: Colors.transparent,

        //set background color as transparent when mourse hover
        hoverColor: Colors.transparent,

        hintText: widget.hintText,
        hintStyle: PrimaryFont.light(17).copyWith(
          color: const Color(0XFFC4C4C4),
          height: 1,
        ),

        suffixIcon: widget.inputType == InputType.Password
            ? IconButton(
                onPressed: () => setState(() {
                  _isHidePassword = !_isHidePassword;
                }),
                icon: Icon(
                  _isHidePassword ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0XFFD0D2D1),
                  size: 17,
                ),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              )
            : null,

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

        contentPadding: widget.inputType == InputType.Code
            ? const EdgeInsets.all(23)
            : const EdgeInsets.only(
                left: 20,
                top: 25,
                bottom: 22,
              ),
      ),

      // set style of text input
      style: PrimaryFont.medium(widget.inputType == InputType.Code ? 27.2 : 17)
          .copyWith(
        color: widget.inputType == InputType.Code
            ? kColorPrimary
            : const Color(0XFF111719),
        height: 1,
      ),
    );
  }
}
