import 'package:flutter/material.dart';
import 'package:newsapp/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routename="splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushNamed(context, HomeScreen.routename);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
             Image(image: AssetImage("assets/images/pattern.png"),fit: BoxFit.cover,),
            Center(child: Image(image: AssetImage("assets/images/logo.png")))
          ],
        ),
    );
  }
}
