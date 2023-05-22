class Order {
  final String orderCode;
  final String store;
  final String logo;
  final int totalItems;
  final double price;
  final int deliveryTime;
  final String deliveryUnit;
  final String time;
  final bool status;
  Order({
    required this.orderCode,
    required this.store,
    required this.logo,
    required this.totalItems,
    required this.price,
    required this.deliveryTime,
    required this.deliveryUnit,
    this.time = '01 Jun, 00:00',
    this.status = false,
  });
}

List<Order> orders = [
  Order(
    orderCode: '264100',
    store: 'Starbuck',
    logo: 'assets/images/stores/logo/starbuck.png',
    totalItems: 3,
    price: 12.56,
    deliveryTime: 25,
    deliveryUnit: 'Estimated Arrival',
  ),
  Order(
    orderCode: '154105',
    store: 'Jimmy John’s ',
    logo: 'assets/images/stores/logo/Jimmy Johns.png',
    totalItems: 3,
    price: 17.10,
    deliveryTime: 30,
    deliveryUnit: 'Estimated Arrival',
    time: '20 Jun, 10:30',
    status: true,
  ),
  Order(
    orderCode: '132069',
    store: 'Subway',
    logo: 'assets/images/stores/logo/subway.png',
    totalItems: 2,
    price: 20.50,
    deliveryTime: 10,
    deliveryUnit: 'Estimated Arrival',
    time: '19 Jun, 11:50',
    status: true,
  ),
  Order(
    orderCode: '232442',
    store: 'Pizzhub',
    logo: 'assets/images/stores/subway.png',
    totalItems: 2,
    price: 8.56,
    deliveryTime: 20,
    deliveryUnit: 'Estimated Arrival',
  ),
];

List<Order> delivery({required isLastedOrder}) {
  List<Order> delivery = [];
  for (Order item in orders) {
    if (item.status == isLastedOrder) {
      delivery.add(item);
    }
  }
  return delivery;
}
