import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/utils/themes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 2,
            child: _Header(size: size),
          ),
          const Spacer(),
          Flexible(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.0775),
              child: FractionallySizedBox(
                widthFactor: 0.9,
                alignment: Alignment.centerLeft,
                child: Text(
                  'What would you like to order',
                  style: PrimaryFont.semiBold(30)
                      .copyWith(height: 1.3, color: kColorLightBlack),
                ),
              ),
            ),
          ),
          const Spacer(),
          Flexible(
            flex: 2,
            child: _Search(size: size),
          ),
          const Spacer(),
          Flexible(
            flex: 16,
            child: Container(
              color: Colors.redAccent,
            ),
          )
        ],
      )),
    );
  }
}

class _Search extends StatelessWidget {
  const _Search({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.0775),
      child: Row(
        children: [
          Flexible(
            flex: 15,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0XFFFCFCFD),
                contentPadding: const EdgeInsets.all(0),
                hintText: 'Find for food or restaurant...',
                hintStyle:
                    PrimaryFont.medium(14).copyWith(color: kColorDarklessGray),
                prefixIcon: Container(
                  padding: const EdgeInsets.fromLTRB(18, 19, 14, 20),
                  child: SvgPicture.asset('assets/images/ic_search.svg'),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0XFFEFEFEF),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Flexible(
            flex: 4,
            child: Container(
              decoration: const BoxDecoration(
                color: kColorWhite,
                image: DecorationImage(
                  image: AssetImage('assets/images/ic_double_switch.png'),
                  // fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(14.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(233, 237, 242, 0.5),
                    offset: Offset(2, 3),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: FractionallySizedBox(
              heightFactor: 0.9,
              child: Container(
                decoration: const BoxDecoration(
                  color: kColorWhite,
                  image: DecorationImage(
                    image: AssetImage('assets/images/line.png'),
                    // fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(211, 209, 216, 0.3),
                      offset: Offset(2, 3),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // const Spacer(),
          Flexible(
            flex: 4,
            child: FractionallySizedBox(
              heightFactor: 0.6,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Deliver to ',
                          style: PrimaryFont.medium(14)
                              .copyWith(color: kColorDarkerGray, height: 1.22),
                        ),
                        SvgPicture.asset('assets/images/arrow_down.svg'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '4102  Pretty View Lane',
                      style: PrimaryFont.medium(15)
                          .copyWith(color: kColorPrimary, height: 1.22),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // const Spacer(),
          Expanded(
            child: FractionallySizedBox(
              heightFactor: 0.9,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/avatar.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
