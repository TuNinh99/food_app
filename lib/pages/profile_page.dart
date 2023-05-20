import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/utils/common_define.dart';
import 'package:food_app/utils/themes.dart';
import 'package:food_app/widgets/button_back.dart';
import 'package:food_app/widgets/text_input_group.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          //avatar & banner
          Expanded(
            flex: size.height < 700 ? 3 : 2,
            child: Column(
              children: [
                _BannerAvatar(size: size),
                Text(
                  'Eljad Eendaz',
                  style: PrimaryFont.semiBold(20).copyWith(
                    color: kColorBlack,
                    height: 1,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Edit Profile',
                  style: PrimaryFont.medium(14).copyWith(
                    color: const Color(0XFF9796A1),
                    height: 1,
                  ),
                )
              ],
            ),
          ),
          Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.0775),
                child: Column(
                  children: [
                    const TextInputGroup(
                      title: 'Full name',
                      hintText: 'Your fullname',
                    ),
                    SizedBox(
                      height: size.height < 700 ? 5 : 30,
                    ),
                    const TextInputGroup(
                      title: 'E-mail',
                      hintText: 'Your email',
                      inputType: InputType.Email,
                    ),
                    SizedBox(
                      height: size.height < 700 ? 5 : 30,
                    ),
                    const TextInputGroup(
                      title: 'Phone Number',
                      hintText: 'Your phone number',
                      inputType: InputType.Phone,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class _BannerAvatar extends StatelessWidget {
  const _BannerAvatar({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SvgPicture.asset('assets/images/profile_banner.svg'),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: size.width * 0.0775),
            child: const ButtonBack(),
          ),
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 120),
            child: CircleAvatar(
              backgroundColor: kColorWhite,
              radius: 54,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(45),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 15),
                        blurRadius: 40,
                        color: Color.fromRGBO(255, 197, 41, 0.3),
                      )
                    ]),
                child: Image.asset('assets/images/big_avatar.png'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
