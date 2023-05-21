import 'package:flutter/material.dart';
import '../utils/themes.dart';

class DropdownSelect extends StatefulWidget {
  const DropdownSelect({super.key, required this.categories, this.hint = ''});

  final List<String> categories;
  final String hint;

  @override
  State<DropdownSelect> createState() => _DropdownSelectState();
}

class _DropdownSelectState extends State<DropdownSelect> {
  String? _category;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: DropdownButtonFormField(
        items: widget.categories.map((category) {
          return DropdownMenuItem(
            value: category,
            child: Text(
              category,
              style: PrimaryFont.medium(17).copyWith(
                color: const Color(0XFF111719),
                height: 1,
              ),
            ),
          );
        }).toList(),
        onChanged: (value) => setState(() {
          _category = value!;

          //remove underline when focus to DropdownButtonFormField
          FocusScope.of(context).requestFocus(FocusNode());
        }),
        value: _category,
        icon: const Icon(
          Icons.keyboard_arrow_right_rounded,
          color: Color(0XFF111719),
        ),
        iconSize: 25.0,
        hint: Text(
          widget.hint,
          style: PrimaryFont.medium(17).copyWith(
            color: const Color(0XFF111719),
            height: 1,
          ),
        ),
        focusColor: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        decoration: InputDecoration(
          hoverColor: kColorWhite,
          focusColor: Colors.transparent,
          contentPadding: const EdgeInsets.fromLTRB(20, 24, 17, 24),
          filled: true,
          fillColor: kColorWhite,
          errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 16.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color(0XFFEEEEEE),
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}
