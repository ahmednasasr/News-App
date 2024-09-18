import 'package:flutter/material.dart';
import 'package:newsapp/core/search/serach_screen.dart';
import 'package:newsapp/screens/home_screen.dart';
import 'package:newsapp/screens/news_screen.dart';
import 'package:newsapp/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreen(),
      routes: {
        SplashScreen.routename:(_)=>SplashScreen(),
        HomeScreen.routename:(_)=>HomeScreen(),
        SerachScreen.routename:(_)=>SerachScreen(),
      },
    );
  }
}