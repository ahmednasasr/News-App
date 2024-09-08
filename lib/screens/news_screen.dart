import 'package:flutter/material.dart';
import 'package:newsapp/core/services/apis/api_manger.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/models/source_model.dart';

class NewsScreen extends StatefulWidget {
  final String id;
   NewsScreen({super.key, required this.id});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int selectedtab=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
            future: ApiManger.getsource(widget.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                print("waitting");
                return Center(child: CircularProgressIndicator(),);
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Center(child: Text("Error: ${snapshot.error}"),);
              } else {
                print(snapshot.data?.sources??"");
                List<Sources>? sources = snapshot.data?.sources ?? [];
                return Column(
                  children: [
                    DefaultTabController(
                    length: sources.length,
                    child: TabBar(
                        onTap: (value){
                          selectedtab=value;
                          setState(() {
                          });
                        },
                        labelPadding: EdgeInsets.all(3),
                        indicatorColor: Colors.transparent,
                        isScrollable: true
                        , tabs: sources.map((e) {
                      return Tab(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: selectedtab == sources.indexOf(e)? Colors.green : Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.green)
                          ),
                          child: Text(e.name ?? "error",
                            style: TextStyle(color: selectedtab == sources.indexOf(e)? Colors.white : Colors.green),),
                        ),
                      );
                    }).toList())),
                    if (sources.isNotEmpty) FutureBuilder(
                      future: ApiManger.getNews(sources[selectedtab].id??""),
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
                );
              }
            }
          ),

    );
  }
}
