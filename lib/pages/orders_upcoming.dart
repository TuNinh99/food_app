import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/data/models/orders_infor.dart';
import 'package:food_app/utils/themes.dart';
import 'package:food_app/widgets/header_bar.dart';
import 'package:food_app/widgets/tab_button_box.dart';

class OrdersUpcoming extends StatelessWidget {
  const OrdersUpcoming({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kColorWhite,
      appBar: HeaderBar(
        size: size,
        pageName: 'My Orders',
        isAvatar: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.0775),
            child: const TabButtonBox(
              textLeft: 'Upcoming',
              textRight: 'History',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.0775),
              clipBehavior: Clip.antiAlias,
              itemCount: orderWidgets().length,
              itemBuilder: (context, index) {
                return orderWidgets().elementAt(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> orderWidgets() {
    List<Widget> orderWidgets = [];
    List<Order> upcomingOrders = delivery(isLastedOrder: false);
    List<Order> lastedOrders = delivery(isLastedOrder: true);

    for (var element in upcomingOrders) {
      orderWidgets.add(_OrdersUpcomingItem(order: element));
    }
    orderWidgets.add(
      Container(
        margin: const EdgeInsets.only(
          top: 10,
          bottom: 20,
        ),
        child: Text(
          'Lasted Orders',
          style: PrimaryFont.semiBold(18).copyWith(
            color: const Color(0XFF111719),
            height: 1,
          ),
        ),
      ),
    );
    for (var element in lastedOrders) {
      orderWidgets.add(_OrdersUpcomingItem(order: element));
    }
    return orderWidgets;
  }
}

class _OrdersUpcomingItem extends StatelessWidget {
  const _OrdersUpcomingItem({required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: order.status ? 168 : 238,
      clipBehavior: Clip.none,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        color: kColorWhite,
        borderRadius: BorderRadius.all(Radius.circular(18.5)),
        boxShadow: [
          BoxShadow(
            offset: Offset(18.5, 18.5),
            blurRadius: 36.5,
            color: Color.fromRGBO(211, 209, 216, 0.25),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: _StoreInfor(order: order),
            ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: !order.status,
              child: Expanded(
                flex: 3,
                child: _DeliveryInfor(order: order),
              ),
            ),
            Visibility(
              visible: !order.status,
              child: const SizedBox(
                height: 20,
              ),
            ),
            Expanded(
              flex: 2,
              child: _SelectButtonGroup(
                isLastedOrder: order.status,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StoreInfor extends StatelessWidget {
  const _StoreInfor({
    required this.order,
  });

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Logo store
        Container(
          width: 65,
          height: 65,
          margin: const EdgeInsets.only(right: 18),
          decoration: const BoxDecoration(
            color: kColorWhite,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(11.5, 17.5),
                blurRadius: 23,
                color: Color.fromRGBO(211, 209, 216, 0.45),
              ),
            ],
          ),
          child: Center(
            child: Image.asset(order.logo),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: order.status ? 0 : 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Visibility(
                    visible: order.status,
                    child: Text(
                      order.time,
                      style: PrimaryFont.medium(12).copyWith(
                        color: const Color(0XFF9796A1),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: order.status,
                    child: Container(
                      width: 4,
                      height: 4,
                      margin: const EdgeInsets.symmetric(horizontal: 9),
                      decoration: const BoxDecoration(
                        color: Color(0XFF9796A1),
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                    ),
                  ),
                  Text(
                    '${order.totalItems} Items',
                    style: PrimaryFont.medium(12).copyWith(
                      color: const Color(0XFF9796A1),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    order.store,
                    style: PrimaryFont.semiBold(16).copyWith(
                      color: kColorBlack,
                      height: 1,
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: kColorDrakGreen,
                    child: SvgPicture.asset('assets/images/tick.svg'),
                  ),
                ],
              ),
              Visibility(
                visible: order.status,
                child: Row(
                  children: [
                    Container(
                      width: 7,
                      height: 7,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3.5)),
                        color: Color(0XFF4EE476),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      'Order Delivered',
                      style: PrimaryFont.light(12).copyWith(
                        color: const Color(0XFF4EE476),
                        height: 1,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Text(
          order.status
              ? '\$${order.price.toStringAsFixed(2)}'
              : '#${order.orderCode}',
          style: PrimaryFont.medium(16).copyWith(
            color: kColorPrimary,
            height: 1,
          ),
        ),
      ],
    );
  }
}

class _DeliveryInfor extends StatelessWidget {
  const _DeliveryInfor({
    required this.order,
  });

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              order.deliveryUnit,
              style: PrimaryFont.medium(12).copyWith(
                color: const Color(0XFF9796A1),
                height: 1,
              ),
            ),
            RichText(
              text: TextSpan(
                text: '${order.deliveryTime}',
                style: PrimaryFont.semiBold(39).copyWith(
                  color: const Color(0XFF111719),
                  height: 1,
                ),
                children: [
                  TextSpan(
                    text: ' min',
                    style: PrimaryFont.medium(15).copyWith(
                      color: const Color(0XFF111719),
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Now',
              style: PrimaryFont.medium(12).copyWith(
                color: const Color(0XFF9796A1),
                height: 1,
              ),
            ),
            Text(
              'Food on the way',
              style: PrimaryFont.medium(14).copyWith(
                color: const Color(0XFF111719),
                height: 1.4,
              ),
            ),
            const Spacer()
          ],
        )
      ],
    );
  }
}

class _SelectButtonGroup extends StatelessWidget {
  const _SelectButtonGroup({this.isLastedOrder = false});

  final bool isLastedOrder;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 43,
            decoration: const BoxDecoration(
              color: kColorWhite,
              borderRadius: BorderRadius.all(Radius.circular(100)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 30,
                  color: Color.fromRGBO(211, 209, 216, 0.251),
                ),
              ],
            ),
            child: Center(
              child: Text(
                isLastedOrder ? 'Rate' : 'Cancel',
                style: PrimaryFont.medium(15).copyWith(
                  color: const Color(0XFF111719),
                  height: 1,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 17,
        ),
        Expanded(
          child: Container(
            height: 43,
            decoration: const BoxDecoration(
                color: kColorPrimary,
                borderRadius: BorderRadius.all(Radius.circular(28.5)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 20),
                    blurRadius: 30,
                    color: Color.fromRGBO(254, 114, 76, 0.251),
                  )
                ]),
            child: Center(
              child: Text(
                isLastedOrder ? 'Re-Order' : 'Track Order',
                style: PrimaryFont.medium(15).copyWith(
                  color: kColorWhite,
                  height: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
