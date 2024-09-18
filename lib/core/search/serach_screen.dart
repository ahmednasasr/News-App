import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/custome_widgets/Bg_custome.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/models/source_model.dart';

import '../../screens/news_detail.dart';
import '../services/apis/api_manger.dart';
class SerachScreen extends StatefulWidget {
  Sources? source;
  static const String routename="search";
   SerachScreen({super.key,  this.source});

  @override
  State<SerachScreen> createState() => _SerachScreenState();
}

class _SerachScreenState extends State<SerachScreen> {
TextEditingController controller= TextEditingController();

bool issearch=false;

  @override
  Widget build(BuildContext context) {
    return BgCustome(
        child: Scaffold(
          appBar: AppBar(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40),bottomLeft:Radius.circular(40)
          )
        ),
            leading: SizedBox(),
            leadingWidth: 0,
            toolbarHeight: 80,
            title: TextFormField(
              controller: controller,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.green),
              decoration: InputDecoration(
                suffixIcon: InkWell(
                    onTap: (){
                    setState(() {
                      issearch= true;
                    });
                      },
                    child: Icon(Icons.search)),
                fillColor: Colors.white,
                filled: true,

                labelText: "Search",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )
              ),
            ),
      ),
          body: issearch==false ? Center(child: Text("no data"),)
              : FutureBuilder(
            future: ApiManger.search(widget.source?.name ?? "", controller.text),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else {
                print(snapshot.data?.articles.length);
                List<Article> article = snapshot.data?.articles ?? [];
                return ListView.builder(
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
                                    placeholder: (context, url) =>
                                        Center(child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Center(child: Icon(Icons.error)),
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
                    },
                );
              }
            },
          ),
    ));
  }
}
