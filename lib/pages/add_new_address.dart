import 'package:flutter/material.dart';
import 'package:food_app/utils/common_define.dart';
import 'package:food_app/utils/themes.dart';
import 'package:food_app/widgets/dropdown_select.dart';
import 'package:food_app/widgets/header_bar.dart';
import 'package:food_app/widgets/text_input_group.dart';

List<String> categories = [
  "Food",
  "Transport",
  "Personal",
  "Shopping",
  "Medical",
  "Rent",
  "Movie",
  "Salary"
];

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColorWhite,
      appBar: HeaderBar(
        size: size,
        pageName: 'Add new address',
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.0775),
        child: Column(
          children: [
            const TextInputGroup(
              title: 'Full name',
              hintText: 'Your fullname',
            ),
            _Distance2Items(
              size: size,
              ratio: size.height < 700 ? 0.01 : 0.02,
            ),
            const TextInputGroup(
              title: 'Mobile number',
              hintText: 'Your mobile number',
              inputType: InputType.Phone,
            ),
            _Distance2Items(
              size: size,
              ratio: size.height < 700 ? 0.02 : 0.02,
            ),
            const _DropdownSelectGroup(
              title: 'State',
              hintText: 'Select State',
            ),
            _Distance2Items(
              size: size,
              ratio: size.height < 700 ? 0.01 : 0.02,
            ),
            const _DropdownSelectGroup(
              title: 'City',
              hintText: 'Select City',
            ),
            _Distance2Items(
              size: size,
              ratio: size.height < 700 ? 0.01 : 0.02,
            ),
            const TextInputGroup(
              title: 'Street (Include house number)',
              hintText: 'Street',
              inputType: InputType.Address,
            ),
            _Distance2Items(
              size: size,
              ratio: size.height < 700 ? 0.02 : 0.04,
            ),
            const _SaveButton()
          ],
        ),
      ),
    );
  }
}

class _Distance2Items extends StatelessWidget {
  const _Distance2Items({
    required this.size,
    this.ratio = 0.02,
  });

  final Size size;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * ratio,
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 248,
      height: 60,
      decoration: const BoxDecoration(
          color: kColorPrimary,
          borderRadius: BorderRadius.all(Radius.circular(28.5)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 20),
              blurRadius: 30,
              color: Color.fromRGBO(254, 114, 76, 0.251),
            )
          ]),
      child: Center(
        child: Text(
          'SAVE',
          style: PrimaryFont.medium(15).copyWith(
            color: kColorWhite,
            height: 1,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}

class _DropdownSelectGroup extends StatelessWidget {
  const _DropdownSelectGroup({required this.title, required this.hintText});

  final String title;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: PrimaryFont.medium(16).copyWith(
            color: const Color(0XFF9796A1),
            height: 1,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        DropdownSelect(
          categories: categories,
          hint: hintText,
        ),
      ],
    );
  }
}
