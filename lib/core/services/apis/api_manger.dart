import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/models/source_model.dart';
import '../../../models/news_model.dart';

class ApiManger{

  static Future<NewsModel> getNews(String id)async {

    Uri url = Uri.https("newsapi.org","v2/everything",{
      "sources":id,
      "apiKey":"3f428a79de044788a05be27a9e61a982"
    });
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);

    return NewsModel.formJson(json);
  }

  static Future<SourceModel> getsource(String catid)async {
    Uri url = Uri.parse("https://newsapi.org/v2/top-headlines/sources?apiKey=3f428a79de044788a05be27a9e61a982&category=$catid");
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);

    return SourceModel.fromJson(json);

  }
}