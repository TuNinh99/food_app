import 'package:flutter/material.dart';
import 'package:food_app/data/models/foods.dart';
import 'package:food_app/utils/themes.dart';
import 'package:food_app/widgets/get_amount_food.dart';
import 'package:food_app/widgets/header_back_type.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: HeaderBackType(
        size: size,
        pageName: 'Cart',
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.0775),
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: Column(
                  children: [
                    Expanded(
                      flex: size.height < 800 ? 6 : 4,
                      child: const _FoodSelected(),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 27),
                      child: const _PromoCode(),
                    ),
                    const Expanded(
                      flex: 5,
                      child: _Bill(),
                    )
                  ],
                ),
              ),
              const _CheckoutButton(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Bill extends StatelessWidget {
  const _Bill();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _PriceLine(
          text: 'Subtotal',
          price: 27.3,
        ),
        _BottomLine(),
        _PriceLine(
          text: 'Tax and Fees',
          price: 5.3,
        ),
        _BottomLine(),
        _PriceLine(
          text: 'Delivery',
          price: 1,
        ),
        _BottomLine(),
        _PriceLine(
          text: 'Total',
          price: 33.6,
        ),
      ],
    );
  }
}

class _BottomLine extends StatelessWidget {
  const _BottomLine();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          style: BorderStyle.solid,
          color: const Color(0XFFF1F2F3),
        ),
      ),
    );
  }
}

class _PriceLine extends StatelessWidget {
  const _PriceLine({required this.text, required this.price});

  final String text;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: PrimaryFont.medium(16).copyWith(
            color: kColorBlack,
            height: 1,
          ),
        ),
        RichText(
          text: TextSpan(
            text: '\$${price.toStringAsFixed(2)}',
            style: PrimaryFont.medium(19).copyWith(
              color: kColorBlack,
              height: 1,
            ),
            children: [
              TextSpan(
                text: ' USD',
                style: PrimaryFont.light(14).copyWith(
                  color: const Color(0XFF9796A1),
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CheckoutButton extends StatelessWidget {
  const _CheckoutButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 248,
      height: 57,
      padding: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
        color: kColorPrimary,
        borderRadius: BorderRadius.all(
          Radius.circular(28.5),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8),
            blurRadius: 30,
            color: Color.fromRGBO(254, 114, 76, 0.251),
          ),
        ],
      ),
      child: Center(
        child: Text(
          'CHECKOUT',
          style: PrimaryFont.medium(15).copyWith(
            color: kColorWhite,
            height: 1,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}

class _FoodSelected extends StatelessWidget {
  const _FoodSelected();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      clipBehavior: Clip.none,
      itemCount: carts.length,
      itemBuilder: (context, index) {
        Food food = carts[index];
        return Container(
          height: 84,
          margin: const EdgeInsets.only(bottom: 27),
          child: Row(
            children: [
              Container(
                width: 82,
                height: 82,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(3, 10),
                      blurRadius: 10,
                      color: kColorYellow.withOpacity(0.2),
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: Image.asset(
                    food.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            food.name,
                            style: PrimaryFont.semiBold(18).copyWith(
                              color: kColorBlack,
                              height: 1,
                            ),
                            maxLines: 1,
                          ),
                          const Icon(
                            Icons.close,
                            size: 17,
                            color: Color(0XFFFF3600),
                          )
                        ],
                      ),
                      Text(
                        food.shortDescription,
                        style: PrimaryFont.light(14).copyWith(
                          color: const Color(0XFF8C8A9D),
                          height: 1,
                        ),
                        maxLines: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '\$${food.price.toStringAsFixed(2)}',
                              style: PrimaryFont.semiBold(16).copyWith(
                                color: kColorPrimary,
                                height: 1,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(
                              width: 90,
                              child: GetAmountOfFood(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class _PromoCode extends StatelessWidget {
  const _PromoCode();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Promo Code',
            hintStyle: PrimaryFont.light(14).copyWith(
              color: const Color(0XFFBEBEBE),
              height: 1,
            ),
            contentPadding: const EdgeInsets.only(
              left: 25,
              top: 25,
              bottom: 19,
              right: 120,
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(100.0),
              ),
              borderSide: BorderSide(
                width: 1,
                style: BorderStyle.solid,
                color: Color(0XFFEEEEEE),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: const BorderSide(
                color: kColorPrimary,
              ),
            ),
          ),
          style: PrimaryFont.medium(17).copyWith(
            color: const Color(0XFF111719),
            height: 1,
          ),
        ),
        Container(
          width: 97,
          height: 44,
          margin: const EdgeInsets.only(right: 10),
          decoration: const BoxDecoration(
            color: kColorPrimary,
            borderRadius: BorderRadius.all(
              Radius.circular(28.5),
            ),
          ),
          child: Center(
            child: Text(
              'Apply',
              style: PrimaryFont.light(16).copyWith(
                color: kColorWhite,
                height: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
