import 'package:food_app/data/models/ratingInfo.dart';

class Food {
  final String name;
  final String image;
  final String shortDescription;
  final double price;
  final bool isFavourite;
  final RatingInfo ratingInfo;
  final String description;
  final List<AddOn> addOn;

  Food({
    required this.name,
    required this.image,
    required this.shortDescription,
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
      price: 5.50,
      isFavourite: false,
      ratingInfo: RatingInfo(
        rate: 4.5,
        numberRate: 25,
      ),
      description:
          'A salad is a dish consisting of mixed, mostly natural ingredients. They are typically served chilled or at room temperature, though some can be served warm.',
      addOn: []),
  Food(
      name: 'Salmon Pizza',
      image: 'assets/images/foods/pizza.png',
      shortDescription: 'Baked salmon fish',
      price: 8.25,
      isFavourite: true,
      ratingInfo: RatingInfo(rate: 4.7, numberRate: 86),
      description:
          'This is pizza prepared with seafood as a primary ingredient. Many types of seafood ingredients in fresh, frozen or canned forms may be used on seafood pizza. ',
      addOn: []),
  Food(
    name: 'Ground Beef Tacos',
    image: 'assets/images/foods/beef.png',
    shortDescription: 'Brown the beef better',
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
];
