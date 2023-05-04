import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/data/models/categories.dart';
import 'package:food_app/data/models/restaurants.dart';
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
            Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: _CategoriesView(size: size),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.0775),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Featured Restaurants',
                        style: PrimaryFont.semiBold(18)
                            .copyWith(color: kColorLightBlack, height: 1.3),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'View All ',
                          style: PrimaryFont.medium(13)
                              .copyWith(color: kColorPrimary, height: 1.2),
                        ),
                        SvgPicture.asset('assets/images/arrow_right.svg')
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 8,
              // fit: FlexFit.tight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.075, vertical: 16),
                child: ListView.builder(
                  // shrinkWrap: true,
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    return _RestaurantsView(
                      size: size,
                      restaurant: restaurants[index],
                    );
                  },
                ),
              ),
            ),
            // Flexible(
            //   flex: 3,
            //   child: Container(
            //     color: Colors.redAccent,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class _RestaurantsView extends StatelessWidget {
  _RestaurantsView({required this.size, required this.restaurant});

  final size;
  Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: size.width * 0.7,
      decoration: const BoxDecoration(
        color: kColorWhite,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(15, 15),
            blurRadius: 30,
            color: Color.fromRGBO(211, 209, 216, 0.9),
          )
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    restaurant.cover,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 9.0, vertical: 7.5),
                        decoration: const BoxDecoration(
                          color: kColorWhite,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 5.8),
                              blurRadius: 23,
                              color: Color.fromRGBO(254, 114, 76, 0.2),
                            )
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              restaurant.rate.toString(),
                              style: PrimaryFont.semiBold(11.7)
                                  .copyWith(color: kColorBlack, height: 1.2),
                            ),
                            const Icon(
                              Icons.star,
                              color: kColorYellow,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              '(${restaurant.numberRate}+)',
                              style: PrimaryFont.light(8.2).copyWith(
                                color: const Color(0XFF9796A1),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 7),
                              blurRadius: 15,
                              color: Color.fromRGBO(254, 114, 76, 0.4),
                            )
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundColor: kColorPrimary,
                          radius: 14,
                          child: Image.asset('assets/images/ic_heart.png'),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.only(left: 13, bottom: 14),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 3),
                          child: Text(
                            restaurant.name,
                            style: PrimaryFont.semiBold(15).copyWith(
                              color: kColorBlack,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: kColorDrakGreen,
                          child: SvgPicture.asset('assets/images/tick.svg'),
                        ),
                        const Spacer(
                          flex: 2,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/images/shipper.svg'),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          'Free delivery',
                          style: PrimaryFont.light(12).copyWith(
                              color: const Color(0XFF7E8392), height: 1.1),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SvgPicture.asset(
                          'assets/images/clock.svg',
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          restaurant.deliveryTime,
                          style: PrimaryFont.light(12).copyWith(
                              color: const Color(0XFF7E8392), height: 1.1),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      itemCount: restaurant.tags.length,
                      itemBuilder: (context, index) {
                        return _Tag(
                          tagName: restaurant.tags[index],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({
    required this.tagName,
  });

  final String tagName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.only(right: 8),
      decoration: const BoxDecoration(
        color: Color(0XFFF6F6F6),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Center(
        child: Text(
          tagName,
          style: PrimaryFont.light(12).copyWith(
            color: const Color(0XFF8A8E9B),
          ),
        ),
      ),
    );
  }
}

class _CategoriesView extends StatefulWidget {
  const _CategoriesView({required this.size});

  final Size size;

  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<_CategoriesView> {
  int _selectIndex = 0;

  _CategoriesViewState();
  @override
  Widget build(BuildContext context) {
    Size size = widget.size;
    return ListView.builder(
      // shrinkWrap: true,
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return FractionallySizedBox(
          heightFactor: 0.68,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectIndex = index;
              });
            },
            child: Container(
              width: size.width / 6.5,
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              decoration: BoxDecoration(
                color: _selectIndex == index ? kColorPrimary : kColorWhite,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(29),
                  right: Radius.circular(29),
                ),
                boxShadow: [
                  BoxShadow(
                    color: _selectIndex == index
                        ? const Color.fromRGBO(254, 114, 76, 0.251)
                        : const Color.fromRGBO(211, 209, 216, 0.251),
                    blurRadius: 30,
                    offset: const Offset(0, 20),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(25),
                        ),
                        image: DecorationImage(
                          image: AssetImage(categories[index].image),
                        ),
                        border: Border.all(color: kColorWhite)),
                  ),
                  Text(
                    categories[index].title,
                    style: PrimaryFont.medium(11).copyWith(
                        color: _selectIndex == index
                            ? kColorWhite
                            : const Color(0XFF67666D)),
                  ),
                  const SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
          ),
        );
      },
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
                        offset: Offset(5, 10),
                        blurRadius: 20),
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

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
