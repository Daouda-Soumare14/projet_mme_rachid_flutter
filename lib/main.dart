import 'package:fatima/routes/navigation_route.dart';
import 'package:fatima/views/home.dart';
import 'package:fatima/views/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        NavigationRoute.home: (context) => Home()
      },
    );
  }
}
