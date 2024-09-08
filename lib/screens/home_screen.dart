import 'package:flutter/material.dart';
import 'package:newsapp/models/category_data.dart';

import '../custome_widgets/category_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routename='homescreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
       shape: OutlineInputBorder(
         borderRadius: BorderRadius.only(bottomRight: Radius.circular(40),bottomLeft:Radius.circular(40) )
       ), 
        title: Text("News App"),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              color: Colors.green,
              child: Center(child: Text("News App!",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Icon(Icons.menu,size: 35,),
                SizedBox(width: 5,),
                Text("Categories",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.settings,size: 35,),
                SizedBox(width: 5,),
                Text("Settings",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text("Pick your category \n of interest",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
          SizedBox(height: 10,),
            Expanded(
            child: GridView.builder(
              itemCount: CategoryData.category.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10 ,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2), itemBuilder: (context, index) {
              return CategoryWidget(category: CategoryData.category[index]);
            },
            ),
          )
          ],
        ),
      ),
    );
  }
}

