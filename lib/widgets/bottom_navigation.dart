import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/utils/themes.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 5.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BottomNavigationItem(
            svgIconName: 'ic_navi',
            onClickedItem: () => debugPrint('clicked navi'),
          ),
          _BottomNavigationItem(
            svgIconName: 'ic_address',
            onClickedItem: () => debugPrint('clicked address'),
          ),
          _BottomNavigationItem(
            svgIconName: 'ic_cart',
            number: 4,
            onClickedItem: () => debugPrint('clicked cart'),
          ),
          _BottomNavigationItem(
            svgIconName: 'ic_favourites',
            number: 2,
            onClickedItem: () => debugPrint('clicked favourites'),
          ),
          _BottomNavigationItem(
            svgIconName: 'ic_noti',
            number: 6,
            onClickedItem: () => debugPrint('clicked noti'),
          ),
        ],
      ),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  const _BottomNavigationItem(
      {required this.svgIconName,
      this.number = 0,
      required this.onClickedItem});

  final String svgIconName;
  final int number;
  final VoidCallback onClickedItem;

  @override
  Widget build(BuildContext context) {
    String svgIcon =
        'assets/images/icons/bottom_navibar_icons/$svgIconName${number != 0 ? '_active.svg' : '.svg'}';
    return Stack(
      alignment: Alignment.topRight,
      children: [
        IconButton(
          onPressed: onClickedItem,
          icon: SvgPicture.asset(svgIcon),
        ),
        Visibility(
          visible: number != 0,
          child: Container(
            width: 14.5,
            height: 14.5,
            decoration: const BoxDecoration(
              color: kColorYellow,
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: Center(
              child: Text(
                '$number',
                style: PrimaryFont.light(10).copyWith(
                  color: kColorWhite,
                  height: 1,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
