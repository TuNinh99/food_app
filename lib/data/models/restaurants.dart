import 'package:food_app/data/models/ratingInfo.dart';

class Restaurant {
  final String name;
  final String cover;
  final String deliveryTime;
  final List<String> tags;
  final RatingInfo ratingInfo;

  Restaurant(
      {required this.name,
      required this.cover,
      required this.deliveryTime,
      required this.tags,
      required this.ratingInfo});
}

final restaurants = [
  Restaurant(
    name: 'McDonald\'s',
    cover: 'assets/images/cover_1.png',
    deliveryTime: '10 - 15 mins',
    tags: ['BURGER', 'CHICKEN', 'FAST FODD'],
    ratingInfo: RatingInfo(rate: 4.5, numberRate: 25),
  ),
  Restaurant(
    name: 'Starbuck',
    cover: 'assets/images/cover_2.png',
    deliveryTime: '10 - 15 mins',
    tags: ['BURGER', 'CHICKEN', 'FAST FODD'],
    ratingInfo: RatingInfo(rate: 4.7, numberRate: 99),
  ),
];
