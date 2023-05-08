import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/utils/themes.dart';

class DropMenu extends StatefulWidget {
  const DropMenu({super.key, required this.items});

  final List<String> items;

  @override
  State<DropMenu> createState() => _DropMenuState();
}

class _DropMenuState extends State<DropMenu> {
  String dropdownValue = 'Popular';

  @override
  Widget build(BuildContext context) {
    List<String> items = widget.items;

    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: DropdownButton(
        value: dropdownValue,
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        icon: SvgPicture.asset(
          'assets/images/arrow_down.svg',
          width: 8,
          height: 6,
        ),
        iconEnabledColor: Colors.white,
        style: const TextStyle(
          color: kColorPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        dropdownColor: Colors.transparent,
        elevation: 0,
        underline: Container(),
        // isExpanded: true,
        focusColor: Colors.transparent,
        // isDense: true,
        // autofocus: true,
      ),
    );
  }
}
