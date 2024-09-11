import 'package:flutter/material.dart';
import 'package:newsapp/models/category_data.dart';
import 'package:newsapp/screens/category_screen.dart';
import 'package:newsapp/screens/news_screen.dart';

import '../custome_widgets/category_widget.dart';
import '../custome_widgets/search_delgate.dart';

class HomeScreen extends StatefulWidget {
  static const String routename='homescreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: NewsSearchDelegate(),
                );
              },
            ),
          ],
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
                InkWell(
                    onTap: (){
                      categoryData = null;
                      setState(() {

                      });
                      Navigator.pop(context);
                    },
                    child: Text("Categories",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),)),
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
      body: categoryData == null ?CategoryScreen(ontab: onCategoryClicked,):NewsScreen(id:categoryData!.id)
    );
  }

  CategoryData? categoryData;

  onCategoryClicked(cat){
    categoryData =cat;
    setState(() {

    });
  }
}

