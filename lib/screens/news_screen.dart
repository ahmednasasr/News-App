import 'package:flutter/material.dart';
import 'package:newsapp/core/services/apis/api_manger.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/models/source_model.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("News"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: ApiManger.getsource(),
            builder: (context, snapshot) {
                List<Sources>? sources =snapshot.data?.sources??[];
                return DefaultTabController(
                    length: sources.length ,
                    child: TabBar(
                      labelPadding: EdgeInsets.all(3),
                        indicatorColor: Colors.red,
                        isScrollable: true
                        ,tabs: sources.map((e){
                      return Tab(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.red,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.red)
                          ),
                          child: Text(e.name??"error",style: TextStyle(color: Colors.green),),
                        ),
                      );
                    }).toList()));
              }
          ),
          FutureBuilder(future: ApiManger.getNews(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }else if(snapshot.hasError){
                return Center(child: Text("Error: ${snapshot.error}"),);
              }else{
                List<Article> article = snapshot.data?.articles??[];
                return Expanded(
                  child: ListView.builder(
                    itemCount: article.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(article[index].urlToImage),
                      );
                    },),
                );
              }
            },),
        ],
      )
    );
  }
}
