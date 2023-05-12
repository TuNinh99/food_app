import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/category_page.dart';
import 'package:food_app/pages/food_page.dart';
import 'package:food_app/pages/home_page.dart';
import 'package:food_app/pages/signup_page.dart';
import 'package:food_app/pages/splash_page.dart';
import 'package:food_app/pages/welcome_page.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const FoodApp(), // Wrap your app
    ),
  );
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HomePage(),
      initialRoute: '$SignUpPage',
      routes: {
        '$SplashPage': (context) => const SplashPage(),
        '$WelcomePage': (context) => const WelcomePage(),
        '$SignUpPage': (context) => const SignUpPage(),
        '$HomePage': (context) => const HomePage(),
        '$FoodPage': (context) => const FoodPage(),
        '$CategoryPage': (context) => const CategoryPage(),
      },
    );
  }
}
