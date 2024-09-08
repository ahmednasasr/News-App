import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryData {
  String id;
  String title;
  String image;
  Color color;

  CategoryData({
    required this.id, required this.title, required this.image, required this.color});
  
  static List<CategoryData> category =[
    CategoryData(id: "Sports", title: "Sports", image: "assets/images/ball.png", color: Colors.red),
    CategoryData(id: "Politics", title: "Politics", image: "assets/images/Politics.png", color: Colors.blue),
    CategoryData(id: "bussines", title: "bussines", image: "assets/images/bussines.png", color: Colors.brown),
    CategoryData(id: "enviroment", title: "enviroment", image: "assets/images/environment.png", color: Colors.blueAccent),
    CategoryData(id: "health", title: "health", image: "assets/images/health.png", color: Colors.purple),
    CategoryData(id: "science", title: "science", image: "assets/images/science.png", color: Colors.yellowAccent),
  ];
}