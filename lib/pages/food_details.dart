import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/data/models/foods.dart';
import 'package:food_app/utils/themes.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({super.key});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  @override
  Widget build(BuildContext context) {
    final food = ModalRoute.of(context)!.settings.arguments as Food;
    // final food = popularItems[2];

    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kColorWhite,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.0775),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            child: Image.asset(
                              food.image,
                              fit: BoxFit.fill,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                              top: 16,
                              right: 16,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: Container(
                                      width: 38,
                                      height: 38,
                                      decoration: const BoxDecoration(
                                        color: kColorWhite,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(5, 10),
                                            blurRadius: 20,
                                            color: Color.fromRGBO(
                                                211, 209, 216, 0.3),
                                          ),
                                        ],
                                      ),
                                      child: const Icon(
                                        Icons.arrow_back_ios_new_rounded,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(
                                  flex: 6,
                                ),
                                Expanded(
                                  child: CircleAvatar(
                                    radius: 14.5,
                                    backgroundColor: food.isFavourite
                                        ? kColorPrimary
                                        : const Color.fromRGBO(
                                            255, 255, 255, 0.5),
                                    child: SvgPicture.asset(
                                      'assets/images/ic_heart.svg',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.0775,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Ground Beef Tacos',
                              style: PrimaryFont.semiBold(28).copyWith(
                                color: kColorLightBlack,
                                height: 1.15,
                              ),
                            ),
                          ),
                          Expanded(
                            child: FractionallySizedBox(
                              widthFactor: 0.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 18,
                                    height: 18,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 3),
                                          blurRadius: 10,
                                          color:
                                              Color.fromRGBO(255, 197, 41, 0.4),
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.star,
                                      color: kColorYellow,
                                      size: 18,
                                    ),
                                  ),
                                  Text(
                                    food.ratingInfo.rate.toString(),
                                    style: PrimaryFont.semiBold(14).copyWith(
                                      color: const Color(0XFF111719),
                                      height: 1,
                                    ),
                                  ),
                                  Text(
                                    '(${food.ratingInfo.numberRate}+)',
                                    style: PrimaryFont.medium(14).copyWith(
                                      color: const Color(0XFF9796A1),
                                      height: 1,
                                    ),
                                  ),
                                  Text(
                                    'See Review',
                                    style: PrimaryFont.medium(13).copyWith(
                                      color: kColorPrimary,
                                      height: 1,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: RichText(
                                    text: TextSpan(
                                      text: '\$',
                                      style: PrimaryFont.medium(17).copyWith(
                                        color: kColorPrimary,
                                        height: 1,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: food.price.toStringAsFixed(2),
                                          style:
                                              PrimaryFont.semiBold(31).copyWith(
                                            color: kColorPrimary,
                                            height: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Spacer(
                                  flex: 3,
                                ),
                                const Expanded(
                                  flex: 3,
                                  child: _GetAmountOfFood(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.0775,
                  vertical: 20,
                ),
                child: Text(
                  food.description,
                  style: PrimaryFont.light(15).copyWith(
                    color: const Color(0XFF858992),
                    height: 1.57,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: food.addOn.isNotEmpty,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: size.width * 0.0775),
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Choice of Add On',
                    style: PrimaryFont.semiBold(18).copyWith(
                      color: kColorLightBlack,
                      height: 1,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Visibility(
                visible: food.addOn.isNotEmpty,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: size.width * 0.0775),
                  child: _SelectAddOn(addOns: food.addOn),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: Container(
                width: 167,
                height: 53,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(28.5),
                  ),
                  color: kColorPrimary,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 30,
                      color: Color.fromRGBO(254, 114, 76, 0.2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: kColorWhite,
                        child: SvgPicture.asset(
                            'assets/images/icon_menu/ic_cart.svg'),
                      ),
                    ),
                    Center(
                      child: Text(
                        'ADD TO CART',
                        style: PrimaryFont.light(15)
                            .copyWith(color: kColorWhite, height: 1),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GetAmountOfFood extends StatefulWidget {
  const _GetAmountOfFood();

  @override
  State<_GetAmountOfFood> createState() => __GetAmountOfFoodState();
}

class __GetAmountOfFoodState extends State<_GetAmountOfFood> {
  int amount = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => setState(() {
            amount > 0 ? amount-- : amount = 0;
          }),
          child: Container(
            width: 31,
            height: 31,
            decoration: BoxDecoration(
              color: kColorWhite,
              border: Border.all(
                color: kColorPrimary,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(17),
              ),
            ),
            child: const Icon(
              Icons.remove,
              color: kColorPrimary,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              amount < 10 ? ('0${amount.toString()}') : amount.toString(),
              style: PrimaryFont.semiBold(16).copyWith(
                color: kColorBlack,
                height: 1,
                letterSpacing: 0.25,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => setState(() {
            amount++;
          }),
          child: Container(
            width: 31,
            height: 31,
            decoration: BoxDecoration(
              color: kColorPrimary,
              border: Border.all(
                color: kColorPrimary,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(17),
              ),
            ),
            child: const Icon(
              Icons.add,
              color: kColorWhite,
            ),
          ),
        ),
      ],
    );
  }
}

class _SelectAddOn extends StatefulWidget {
  const _SelectAddOn({required this.addOns});

  final List<AddOn> addOns;

  @override
  State<_SelectAddOn> createState() => __SelectAddOnState();
}

class __SelectAddOnState extends State<_SelectAddOn> {
  @override
  Widget build(BuildContext context) {
    List<AddOn> addOns = widget.addOns;

    int select = -1;

    return ListView.builder(
      itemCount: addOns.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  width: 40,
                  height: 40,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 20,
                    child: Image.asset(addOns[index].image),
                  ),
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Expanded(
                flex: 3,
                child: Text(
                  addOns[index].name,
                  style: PrimaryFont.medium(14).copyWith(
                    color: kColorBlack,
                    height: 1.2,
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Expanded(
                child: Text(
                  '+\$${addOns[index].price}',
                  style: PrimaryFont.medium(14).copyWith(
                    color: kColorBlack,
                    height: 1.2,
                  ),
                ),
              ),
              const _SelectButton(),
            ],
          ),
        );
      },
    );
  }
}

class _SelectButton extends StatefulWidget {
  const _SelectButton({super.key});

  @override
  State<_SelectButton> createState() => __SelectButtonState();
}

class __SelectButtonState extends State<_SelectButton> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        isChecked = !isChecked;
      }),
      child: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          border: Border.all(
            color: isChecked ? kColorPrimary : const Color(0XFFD4D5DA),
            width: 1.5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(11),
          ),
        ),
        child: Visibility(
          visible: isChecked,
          child: Center(
            child: Container(
              width: 13,
              height: 13,
              decoration: const BoxDecoration(
                color: kColorPrimary,
                borderRadius: BorderRadius.all(
                  Radius.circular(6.5),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Color.fromRGBO(254, 114, 76, 0.4),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
