import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/add_new_address.dart';
import 'package:food_app/pages/cart_page.dart';
import 'package:food_app/pages/category_page.dart';
import 'package:food_app/pages/favorites_page.dart';
import 'package:food_app/pages/food_page.dart';
import 'package:food_app/pages/home_page.dart';
import 'package:food_app/pages/login_page.dart';
import 'package:food_app/pages/orders_upcoming.dart';
import 'package:food_app/pages/profile_page.dart';
import 'package:food_app/pages/rating_page.dart';
import 'package:food_app/pages/reset_password_page.dart';
import 'package:food_app/pages/review_restaurant_page.dart';
import 'package:food_app/pages/reviews_page.dart';
import 'package:food_app/pages/signup_page.dart';
import 'package:food_app/pages/splash_page.dart';
import 'package:food_app/pages/verification_page.dart';
import 'package:food_app/pages/welcome_page.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const FoodApp(), // Wrap your app
    ),
    // const FoodApp(),
  );
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Hub',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '$ReviewsPage',
      routes: {
        '$SplashPage': (context) => const SplashPage(),
        '$WelcomePage': (context) => const WelcomePage(),
        '$SignUpPage': (context) => const SignUpPage(),
        '$LoginPage': (context) => const LoginPage(),
        '$VerificationPage': (context) => const VerificationPage(),
        '$ResetPasswordPage': (context) => const ResetPasswordPage(),
        '$HomePage': (context) => const HomePage(),
        '$FoodPage': (context) => const FoodPage(),
        '$CategoryPage': (context) => const CategoryPage(),
        '$CartPage': (context) => const CartPage(),
        '$OrdersUpcoming': (context) => const OrdersUpcoming(),
        '$FavoritesPage': (context) => const FavoritesPage(),
        '$ProfilePage': (context) => const ProfilePage(),
        '$AddNewAddress': (context) => const AddNewAddress(),
        '$RatingPage': (context) => const RatingPage(),
        '$ReviewRestaurantPage': (context) => const ReviewRestaurantPage(),
        '$ReviewsPage': (context) => const ReviewsPage(),
      },
    );
  }
}
