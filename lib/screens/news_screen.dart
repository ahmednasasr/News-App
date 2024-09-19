import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/core/services/apis/api_manger.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/models/source_model.dart';
import 'package:provider/provider.dart';

import '../manger/main_provider.dart';
import 'news_detail.dart';

class NewsScreen extends StatefulWidget {
  final String id;
   NewsScreen({super.key, required this.id});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<mainProvider>(context);
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
               provider.sources= snapshot.data?.sources ?? [];
                return Column(
                  children: [
                    DefaultTabController(
                    length: provider.sources!.length,
                    child: TabBar(
                        onTap: (value){
                          provider.selectedtab=value;
                          setState(() {
                          });
                        },
                        labelPadding: EdgeInsets.all(3),
                        indicatorColor: Colors.transparent,
                        isScrollable: true
                        , tabs:  provider.sources!.map((e) {
                      return Tab(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: provider.selectedtab ==  provider.sources!.indexOf(e)? Colors.green : Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.green)
                          ),
                          child: Text(e.name ?? "error",
                            style: TextStyle(color: provider.selectedtab ==  provider.sources!.indexOf(e)? Colors.white : Colors.green),),
                        ),
                      );
                    }).toList())),
                    if ( provider.sources!.isNotEmpty) FutureBuilder(
                      future: ApiManger.getNews( provider.sources![provider.selectedtab].id??""),
                      builder: (context, snapshot) {
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return Center(child: CircularProgressIndicator(),);
                        }else if(snapshot.hasError){
                          return Center(child: Text("Error: ${snapshot.error}"),);
                        }
                        else{
                          List<Article> article = snapshot.data?.articles??[];
                          return Expanded(
                              child: ListView.builder(
                                itemCount: article.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NewsDetail(
                                            article: article[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: CachedNetworkImage(
                                                imageUrl: article[index].urlToImage ?? "",
                                                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                                errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                                              ),
                                            ),
                                            Text(article[index].source.name ?? ""),
                                            Text(article[index].title ?? ""),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text(article[index].publishedAt.substring(0, 10) ?? ""),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
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


