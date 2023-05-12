/*
  Scrolling screen when keyboard is appears to help Flutter widget not resize
*/

import 'package:flutter/widgets.dart';

class ScrollingWhenKeyboardAppear extends StatelessWidget {
  const ScrollingWhenKeyboardAppear({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      //Creates scroll physics that prevent the scroll offset from exceeding the bounds of the content.
      physics: const ClampingScrollPhysics(),
      child: SizedBox(
        height: size.height,
        child: child,
      ),
      // child: ConstrainedBox(
      //   constraints: BoxConstraints(
      //     minWidth: size.width,
      //     minHeight: size.height,
      //   ),
      //   child: IntrinsicHeight(
      //     child: child,
      //   ),
      // ),
    );
  }
}
