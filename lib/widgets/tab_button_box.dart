import 'package:flutter/material.dart';
import 'package:food_app/utils/themes.dart';

class TabButtonBox extends StatefulWidget {
  const TabButtonBox({super.key, this.textLeft = '', this.textRight = ''});

  final String textLeft;
  final String textRight;

  @override
  State<TabButtonBox> createState() => TabButtonBoxState();
}

class TabButtonBoxState extends State<TabButtonBox> {
  bool isUpcomingTab = true;
  bool isHistoryTab = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: kColorWhite,
              borderRadius: const BorderRadius.all(
                Radius.circular(27.5),
              ),
              border: Border.all(
                width: 1,
                style: BorderStyle.solid,
                color: const Color(0XFFF2EAEA),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 4,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isUpcomingTab = true;
                        isHistoryTab = false;
                      });
                    },
                    child: _TabButton(
                      textBtn: widget.textLeft,
                      isSelected: isUpcomingTab,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isUpcomingTab = false;
                        isHistoryTab = true;
                      });
                    },
                    child: _TabButton(
                      textBtn: widget.textRight,
                      isSelected: isHistoryTab,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({required this.textBtn, this.isSelected = true});

  final String textBtn;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? kColorPrimary : kColorWhite,
        borderRadius: const BorderRadius.all(
          Radius.circular(23.5),
        ),
      ),
      child: Center(
        child: Text(
          textBtn,
          style: PrimaryFont.light(14).copyWith(
            color: isSelected ? const Color(0XFFFEFEFE) : kColorPrimary,
            height: 1,
          ),
        ),
      ),
    );
  }
}
