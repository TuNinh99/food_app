import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/data/models/foods.dart';
import 'package:food_app/utils/themes.dart';
import 'package:food_app/widgets/button_back.dart';
import 'package:food_app/widgets/food_cover.dart';

//<------------------------- MAIN WIDGET ------------------------------>
class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
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
                      child: FoodCover(
                        topLeftWidget: GestureDetector(
                          child: const ButtonBack(),
                          onTap: () => Navigator.pop(context),
                        ),
                        image: food.image,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
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
                      child: _FoodInfor(food: food, size: size),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: _FoodDescription(size: size, food: food),
            ),
            Visibility(
              visible: food.addOn.isNotEmpty,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  // clipBehavior: Clip.antiAlias,
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
              flex: size.width > 375 ? 2 : 3,
              child: Visibility(
                visible: food.addOn.isNotEmpty,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: size.width * 0.0775),
                  child: _SelectAddOn(addOns: food.addOn),
                ),
              ),
            ),
            SizedBox(
              height: size.width > 375 ? size.height / 12 : 0,
            ),
            const _AddToCartButton(),
            SizedBox(
              height: size.width > 380 && size.width < 600 ? 0 : 20,
            ),
          ],
        ),
      ),
    );
  }
}

//<------------------------- SUB WIDGET ------------------------------>
class _AddToCartButton extends StatelessWidget {
  const _AddToCartButton();

  @override
  Widget build(BuildContext context) {
    return Center(
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
                child: SvgPicture.asset('assets/images/icon_menu/ic_cart.svg'),
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
    );
  }
}

class _FoodDescription extends StatelessWidget {
  const _FoodDescription({
    required this.size,
    required this.food,
  });

  final Size size;
  final Food food;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.0775,
        vertical: size.width < 600 ? 10 : 20,
      ),
      child: Text(
        food.description,
        style: PrimaryFont.light(15).copyWith(
          color: const Color(0XFF858992),
          height: 1.57,
        ),
      ),
    );
  }
}

class _FoodInfor extends StatelessWidget {
  const _FoodInfor({
    required this.food,
    required this.size,
  });

  final Food food;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            food.name,
            style: PrimaryFont.semiBold(28).copyWith(
              color: kColorLightBlack,
              height: 1.15,
            ),
          ),
        ),
        Expanded(
          child: FractionallySizedBox(
            widthFactor: size.width > 600 ? 0.3 : 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 3),
                        blurRadius: 10,
                        color: Color.fromRGBO(255, 197, 41, 0.4),
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
                        style: PrimaryFont.semiBold(31).copyWith(
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
    );
  }
}

class _GetAmountOfFood extends StatefulWidget {
  const _GetAmountOfFood();

  @override
  State<_GetAmountOfFood> createState() => __GetAmountOfFoodState();
}

class __GetAmountOfFoodState extends State<_GetAmountOfFood> {
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => setState(() {
            amount > 1 ? amount-- : amount = 1;
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

    return ListView.builder(
      // clipBehavior: Clip.none,
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
  const _SelectButton();

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
