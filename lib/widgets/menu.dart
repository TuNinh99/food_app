import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/utils/themes.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Orientation orientation = MediaQuery.of(context).orientation;

    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _CircleAvatar(),
            const SizedBox(
              height: 18,
            ),
            _UserInformation(
              size: size,
              orientation: orientation,
            ),
            Visibility(
              visible: orientation == Orientation.portrait,
              child: const Spacer(),
            ),
            const _MenuItem(
              image: 'ic_order.svg',
              subTitle: 'My Orders',
            ),
            const _MenuItem(
              image: 'ic_profile.svg',
              subTitle: 'My Profile',
            ),
            const _MenuItem(
              image: 'ic_address.svg',
              subTitle: 'Delivery Address',
            ),
            const _MenuItem(
              image: 'ic_payment.svg',
              subTitle: 'Payment Methods',
            ),
            const _MenuItem(
              image: 'ic_contact.svg',
              subTitle: 'Contact Us',
            ),
            const _MenuItem(
              image: 'ic_setting.svg',
              subTitle: 'Setting',
            ),
            const _MenuItem(
              image: 'ic_qna.svg',
              subTitle: 'Helps & FAQs',
            ),
            Visibility(
              visible: orientation == Orientation.landscape ? false : true,
              child: Spacer(
                flex: size.width < 428 ? 2 : 3,
              ),
            ),
            _LogOutButton(
              orientation: orientation,
            ),
            Visibility(
              visible: orientation == Orientation.landscape ? false : true,
              child: const Spacer(),
            )
          ],
        ),
      ),
    );
  }
}

class _UserInformation extends StatelessWidget {
  const _UserInformation({required this.size, required this.orientation});
  final Size size;
  final Orientation orientation;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: orientation == Orientation.landscape || size.width >= 360 ? 2 : 1,
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Farion Wick',
              style: PrimaryFont.semiBold(20).copyWith(
                color: kColorBlack,
                height: 1,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              'farionwick@gmail.com',
              style: PrimaryFont.medium(14).copyWith(
                color: const Color(0XFF9EA1B1),
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CircleAvatar extends StatelessWidget {
  const _CircleAvatar();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
            offset: Offset(0, 8),
            blurRadius: 40,
            color: Color.fromRGBO(255, 197, 41, 0.25),
          ),
        ]),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 45,
          child: ClipOval(
            child: Image.asset(
              'assets/images/big_avatar.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class _LogOutButton extends StatelessWidget {
  const _LogOutButton({required this.orientation});
  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: orientation == Orientation.landscape ? 35 : 45,
      margin: const EdgeInsets.only(left: 20),
      decoration: const BoxDecoration(
        color: kColorPrimary,
        borderRadius: BorderRadius.all(
          Radius.circular(28.5),
        ),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 30,
              color: Color.fromRGBO(254, 114, 76, 0.2))
        ],
      ),
      child: Row(
        children: [
          const Spacer(),
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/icons/ic_logout.png',
            ),
          ),
          const SizedBox(
            width: 3,
          ),
          Expanded(
            flex: 4,
            child: Text(
              'Log Out',
              style: PrimaryFont.light(16).copyWith(
                color: kColorWhite,
                height: 1,
              ),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({required this.image, required this.subTitle});

  final String image;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: SvgPicture.asset('assets/images/icons/$image'),
          ),
          Expanded(
            flex: 4,
            child: Text(
              subTitle,
              style: PrimaryFont.medium(16)
                  .copyWith(color: kColorBlack, height: 1),
            ),
          ),
        ],
      ),
    );
  }
}
