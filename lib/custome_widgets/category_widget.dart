import 'package:flutter/material.dart';
import 'package:newsapp/models/category_data.dart';

class CategoryWidget extends StatelessWidget {
  CategoryData category;
   CategoryWidget({required this.category,super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: 150,
      height: 180,
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.zero,
              bottomLeft: Radius.circular(25),
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25)


          )),
      child: Column(
        children: [
          Image.asset("${category.image}"),
          Spacer(),
          Text( category.title,style: TextStyle(fontSize: 25,color: Colors.black),),
          Spacer()
        ],
      ),
    );
  }
}
