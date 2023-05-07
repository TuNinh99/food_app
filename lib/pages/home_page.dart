import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/data/models/categories.dart';
import 'package:food_app/data/models/ratingInfo.dart';
import 'package:food_app/data/models/restaurants.dart';
import 'package:food_app/pages/food_details.dart';
import 'package:food_app/utils/themes.dart';
import 'package:food_app/widgets/menu.dart';
import '../data/models/foods.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      drawer: const Menu(),
      body: SafeArea(
        child: ListView(
          children: [
            Visibility(
              visible: orientation == Orientation.portrait ? false : true,
              child: const SizedBox(
                height: 10,
              ),
            ),

            // <---------------------------- Header ---------------------------->
            _Header(size: size),
            const SizedBox(
              height: 30,
            ),

            // <---------------------------- Title ---------------------------->
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.0775),
              child: FractionallySizedBox(
                widthFactor: size.width >= 400 ? 0.8 : 0.9,
                alignment: Alignment.centerLeft,
                child: Text(
                  'What would you like to order',
                  style: PrimaryFont.semiBold(30).copyWith(
                    height: 1,
                    color: kColorLightBlack,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // <---------------------------- Search ---------------------------->
            _Search(size: size),
            const SizedBox(
              height: 30,
            ),

            // <---------------------------- Categories View ---------------------------->
            _CategoriesView(size: size),
            const SizedBox(
              height: 30,
            ),

            // <---------------------------- Text: Featured Restaurants ---------------------------->
            Container(
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
            const SizedBox(
              height: 15,
            ),

            // <---------------------------- RestaurantsView View ---------------------------->
            Container(
              height: 229,
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.075),
              child: ListView.builder(
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

            const SizedBox(
              height: 24,
            ),

            // <---------------------------- Popular Items ---------------------------->
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.075),
              child: Text(
                'Popular Items',
                style: PrimaryFont.semiBold(18)
                    .copyWith(color: kColorBlack, height: 1),
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            _PopularItems(size: size),
          ],
        ),
      ),
    );
  }
}

class _PopularItems extends StatelessWidget {
  const _PopularItems({
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 216,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.0775),
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: popularItems.length,
        itemBuilder: (context, index) {
          final Food food = popularItems[index];
          String price = food.price.toStringAsFixed(2);
          return GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
              '$FoodDetails',
              arguments: popularItems[index],
            ),
            child: Container(
              height: 215,
              width: 200,
              margin: const EdgeInsets.only(right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          child: Image.asset(
                            food.image,
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 62,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 7,
                                  vertical: 4,
                                ),
                                decoration: const BoxDecoration(
                                  color: kColorWhite,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 6),
                                      blurRadius: 23,
                                      color: Color.fromRGBO(254, 76, 114, 0.2),
                                    ),
                                  ],
                                ),
                                child: RichText(
                                  text: TextSpan(
                                    text: '\$',
                                    style: PrimaryFont.medium(11).copyWith(
                                      color: kColorPrimary,
                                      height: 1.1,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: price,
                                        style:
                                            PrimaryFont.semiBold(20).copyWith(
                                          color: kColorBlack,
                                          height: 1.1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                radius: 14.5,
                                backgroundColor: food.isFavourite
                                    ? kColorPrimary
                                    : const Color.fromRGBO(255, 255, 255, 0.5),
                                child: SvgPicture.asset(
                                  'assets/images/ic_heart.svg',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 10,
                          bottom: -12,
                          child: Container(
                            padding: const EdgeInsets.all(0),
                            child: _RatingBox(ratingInfo: food.ratingInfo),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 17),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              food.name,
                              style: PrimaryFont.semiBold(14).copyWith(
                                color: kColorBlack,
                                height: 1,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              food.shortDescription,
                              style: PrimaryFont.light(12).copyWith(
                                color: const Color(0XFF9796A1),
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _RestaurantsView extends StatelessWidget {
  _RestaurantsView({required this.size, required this.restaurant});

  final Size size;
  Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 266,
      margin: const EdgeInsets.only(right: 15),
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
                      _RatingBox(ratingInfo: restaurant.ratingInfo),
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

class _RatingBox extends StatelessWidget {
  const _RatingBox({
    required this.ratingInfo,
  });

  final RatingInfo ratingInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 7.5),
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
            ratingInfo.rate.toString(),
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
            '(${ratingInfo.numberRate}+)',
            style: PrimaryFont.light(8.2).copyWith(
              color: const Color(0XFF9796A1),
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
    return Container(
      width: double.infinity,
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.0775),
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectIndex = index;
              });
            },
            child: Container(
              width: 59,
              margin: EdgeInsets.only(right: size.width * 0.06),
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
                      border: Border.all(color: kColorWhite),
                    ),
                  ),
                  Text(
                    categories[index].title,
                    style: PrimaryFont.medium(11).copyWith(
                      color: _selectIndex == index
                          ? kColorWhite
                          : const Color(0XFF67666D),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
          );
        },
      ),
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.0775),
      child: Row(
        children: [
          Expanded(
            flex: 14,
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
          Container(
            width: 54,
            height: 54,
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
                  offset: Offset(0, 15),
                  blurRadius: 30,
                ),
              ],
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
    return Container(
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 45, minHeight: 45),
            child: GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Container(
                decoration: const BoxDecoration(
                  color: kColorWhite,
                  image: DecorationImage(
                    image: AssetImage('assets/images/line.png'),
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
          const Spacer(),
          Column(
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
          const Spacer(),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 45, minHeight: 45),
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
          ),
        ],
      ),
    );
  }
}
