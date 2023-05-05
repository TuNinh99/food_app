import 'package:food_app/data/models/ratingInfo.dart';

class Food {
  final String name;
  final String image;
  final String description;
  final double price;
  final bool isFavourite;
  final RatingInfo ratingInfo;

  Food(
      {required this.name,
      required this.image,
      required this.description,
      required this.price,
      required this.isFavourite,
      required this.ratingInfo});
}

List<Food> popularItems = [
  Food(
    name: 'Salmon Salad',
    image: 'assets/images/salad.png',
    description: 'Baked salmon fish',
    price: 5.50,
    isFavourite: false,
    ratingInfo: RatingInfo(rate: 4.5, numberRate: 25),
  ),
  Food(
    name: 'Salmon Pizza',
    image: 'assets/images/pizza.png',
    description: 'Baked salmon fish',
    price: 8.25,
    isFavourite: true,
    ratingInfo: RatingInfo(rate: 4.7, numberRate: 86),
  ),
];
