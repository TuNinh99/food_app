// TextInputGroup
import 'package:flutter/material.dart';
import 'package:food_app/utils/common_define.dart';
import 'package:food_app/utils/themes.dart';
import 'package:food_app/widgets/text_input_field.dart';

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
            boxShadow: [
              BoxShadow(
                offset: Offset(15, 20),
                blurRadius: 30,
                color: Color.fromRGBO(233, 233, 233, 0.25),
              ),
            ],
          ),
          child: TextInputField(
            inputType: widget.inputType,
            hintText: widget.hintText,
          ),
        ),
      ],
    );
  }
}
