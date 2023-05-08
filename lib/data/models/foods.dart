// ignore_for_file: constant_identifier_names

import 'package:food_app/data/models/ratingInfo.dart';

enum TypeOfFood {
  Salad,
  Pizza,
  Beef,
}

class Food {
  final String name;
  final String image;
  final String shortDescription;
  final TypeOfFood type;
  final double price;
  final bool isFavourite;
  final RatingInfo ratingInfo;
  final String description;
  final List<AddOn> addOn;

  Food({
    required this.name,
    required this.image,
    required this.shortDescription,
    required this.type,
    required this.price,
    required this.isFavourite,
    required this.ratingInfo,
    required this.description,
    required this.addOn,
  });
}

class AddOn {
  final String name;
  final String image;
  final double price;

  AddOn({required this.name, required this.image, required this.price});
}

List<Food> popularItems = [
  Food(
    name: 'Salmon Salad',
    image: 'assets/images/foods/salad.png',
    shortDescription: 'Vegetables and some fruits',
    type: TypeOfFood.Salad,
    price: 5.50,
    isFavourite: false,
    ratingInfo: RatingInfo(
      rate: 4.5,
      numberRate: 25,
    ),
    description:
        'A salad is a dish consisting of mixed, mostly natural ingredients. They are typically served chilled or at room temperature, though some can be served warm.',
    addOn: [],
  ),
  Food(
    name: 'Salmon Pizza',
    image: 'assets/images/foods/pizza.png',
    shortDescription: 'Baked salmon fish',
    type: TypeOfFood.Pizza,
    price: 8.25,
    isFavourite: true,
    ratingInfo: RatingInfo(rate: 4.7, numberRate: 86),
    description:
        'This is pizza prepared with seafood as a primary ingredient. Many types of seafood ingredients in fresh, frozen or canned forms may be used on seafood pizza. ',
    addOn: [],
  ),
  Food(
    name: 'Ground Beef Tacos',
    image: 'assets/images/foods/beef.png',
    shortDescription: 'Brown the beef better',
    type: TypeOfFood.Beef,
    price: 9.5,
    isFavourite: true,
    ratingInfo: RatingInfo(rate: 4.5, numberRate: 30),
    description:
        'Brown the beef better. Lean ground beef - I like to use 85% lean angus. Garlic - use fresh chopped. Spices - chili powder, cumin, onion powder. ',
    addOn: [
      AddOn(
        name: 'Pepper  Julienned',
        image: 'assets/images/addon/pepper.png',
        price: 2.3,
      ),
      AddOn(
        name: 'Baby Spinach',
        image: 'assets/images/addon/spinach.png',
        price: 4.7,
      ),
      AddOn(
        name: 'Masroom',
        image: 'assets/images/addon/masroom.png',
        price: 2.5,
      )
    ],
  ),
  Food(
    name: 'Chicken Hawaiian',
    image: 'assets/images/foods/pizza_chicken.png',
    shortDescription: 'Chicken, Cheese and pineapple',
    type: TypeOfFood.Pizza,
    price: 10.35,
    isFavourite: false,
    ratingInfo: RatingInfo(
      rate: 4.7,
      numberRate: 56,
    ),
    description:
        'Hawaiian Chicken is like a cross between pineapple chicken, sweet and sour chicken, and brown sugar chicken. It has a sweet sticky sauce, and delightful chunks of pineapple and peppers, served over white rice.',
    addOn: [],
  ),
  Food(
    name: 'Seafood pizza',
    image: 'assets/images/foods/pizza_seafood.png',
    shortDescription: 'Shrimp, Crad and squid',
    type: TypeOfFood.Pizza,
    price: 18.49,
    isFavourite: true,
    ratingInfo: RatingInfo(
      rate: 4.3,
      numberRate: 29,
    ),
    description:
        'Many types of seafood ingredients in fresh, frozen or canned forms may be used on seafood pizza. Some retail pizza chains, as well as smaller restaurants, offer seafood pizzas to consumers. ',
    addOn: [],
  ),
];
