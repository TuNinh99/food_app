//fix data for categories in home page

final categories = [
  Categories(
      title: 'Burger', image: 'assets/images/categories/food_burger.png'),
  Categories(title: 'Donat', image: 'assets/images/categories/food_donat.png'),
  Categories(title: 'Pizza', image: 'assets/images/categories/food_pizza.png'),
  Categories(
      title: 'Mexican', image: 'assets/images/categories/food_mexican.png'),
  Categories(title: 'Asian', image: 'assets/images/categories/food_asian1.png'),
  Categories(title: 'Asian', image: 'assets/images/categories/food_asian2.png'),
];

class Categories {
  final String title;
  final String image;

  Categories({required this.title, required this.image});
}
