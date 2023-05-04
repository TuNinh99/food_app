class Restaurant {
  final String name;
  final String cover;
  final double rate;
  final double numberRate;
  final String deliveryTime;
  final List<String> tags;

  Restaurant(
      {required this.name,
      required this.cover,
      required this.rate,
      required this.numberRate,
      required this.deliveryTime,
      required this.tags});
}

final restaurants = [
  Restaurant(
    name: 'McDonald\'s',
    cover: 'assets/images/cover_1.png',
    rate: 4.5,
    numberRate: 25,
    deliveryTime: '10 - 15 mins',
    tags: ['BURGER', 'CHICKEN', 'FAST FODD'],
  ),
  Restaurant(
    name: 'Starbuck',
    cover: 'assets/images/cover_2.png',
    rate: 4.7,
    numberRate: 99,
    deliveryTime: '10 - 15 mins',
    tags: ['BURGER', 'CHICKEN', 'FAST FODD'],
  ),
];
