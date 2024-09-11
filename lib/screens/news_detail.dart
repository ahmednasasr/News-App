import 'package:flutter/material.dart';
import 'package:newsapp/models/news_model.dart';

class NewsDetail extends StatelessWidget {
  final Article article;

  const NewsDetail({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(40), bottomLeft: Radius.circular(40)),
        ),
        title: Text("News App"),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(article.urlToImage ?? "", errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error);
              }),
            ),
            SizedBox(height: 10),
            Text(article.source.name ?? "Unknown Source", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(article.title ?? "No Title", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(article.publishedAt.substring(0, 10) ?? "", style: TextStyle(color: Colors.grey)),
            SizedBox(height: 10),
            Text(article.description ?? "No Description", style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text(article.content ?? "No Content", style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
