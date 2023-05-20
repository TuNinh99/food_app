import 'package:flutter/material.dart';
import 'package:food_app/data/models/foods.dart';
import 'package:food_app/widgets/food_item.dart';
import 'package:food_app/widgets/header_bar.dart';
import 'package:food_app/widgets/tab_button_box.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: HeaderBar(
        size: size,
        pageName: 'Favorites',
        isAvatar: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.0775),
            child: const TabButtonBox(
              textLeft: 'Food Items',
              textRight: 'Restaurents',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.0775),
              itemCount: popularItems.length,
              itemBuilder: (context, index) {
                final item = popularItems[index];
                return FoodItem(
                  size: size,
                  item: item,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
