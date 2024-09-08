import 'dart:convert';

class NewsModel {
  late String status;
  late int totalResults;
  late List<Article> articles;

  NewsModel(this.status, this.totalResults, this.articles);

  NewsModel.formJson(Map<String, dynamic> json) {
    articles = <Article>[];
    status = json["status"];
    totalResults = json["totalResults"];
    json["articles"].forEach((e) {
      articles.add(Article.fromJson(e));
    });
  }
}

class Article {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;
  Source source;

  Article(this.author, this.title, this.description, this.url, this.urlToImage,
      this.publishedAt, this.content, this.source);


  Article.fromJson(Map<String, dynamic> json)
      : author = json["author"] ?? "Unknown Author",
        title = json["title"] ?? "No Title",
        description = json["description"] ?? "No Description",
        url = json["url"] ?? "",
        urlToImage = json["urlToImage"] ?? "",
        publishedAt = json["publishedAt"] ?? "",
        content = json["content"] ?? "No Content",
        source = Source.formJson(json["source"]);
}

class Source {
  String? id;
  String name;

  Source(this.id, this.name);

  Source.formJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"];
}
