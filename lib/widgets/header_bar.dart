import 'package:flutter/material.dart';
import 'package:food_app/utils/themes.dart';
import 'package:food_app/widgets/button_back.dart';

class HeaderBar extends StatelessWidget implements PreferredSizeWidget {
  const HeaderBar({
    super.key,
    required this.size,
    required this.pageName,
    this.isAvatar = false,
  });

  final Size size;
  final String pageName;
  final bool isAvatar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.0775),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const ButtonBack(),
          ),
          Expanded(
            child: Center(
              child: Text(
                pageName,
                style: PrimaryFont.medium(18).copyWith(
                  color: const Color(0XFF111719),
                  height: 1,
                ),
              ),
            ),
          ),
          Visibility(
            visible: isAvatar,
            child: const _Avatar(),
          ),
          Visibility(
            visible: !isAvatar,
            child: const SizedBox(
              width: 45,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(45);
}

class _Avatar extends StatelessWidget {
  const _Avatar();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 45, maxHeight: 45),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/avatar.png'),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 16,
              color: Color.fromRGBO(255, 197, 41, 0.3),
            )
          ],
        ),
      ),
    );
  }
}
