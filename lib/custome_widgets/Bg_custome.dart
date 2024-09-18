import 'package:flutter/material.dart';

class BgCustome extends StatelessWidget {
  Widget child;
   BgCustome({required this.child,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"),fit: BoxFit.cover
        )
      ),
      child: child,
    );
  }
}
