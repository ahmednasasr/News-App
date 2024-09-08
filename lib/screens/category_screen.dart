import 'package:flutter/material.dart';

import '../custome_widgets/category_widget.dart';
import '../models/category_data.dart';

class CategoryScreen extends StatelessWidget {
  void Function(CategoryData) ontab;
   CategoryScreen({super.key,required this.ontab});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              return InkWell(
                  onTap: (){
                    ontab(CategoryData.category[index]);
                  },
                  child: CategoryWidget(category: CategoryData.category[index]));
            },
            ),
          )
        ],
      ),
    );
  }


}
