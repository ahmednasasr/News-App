import 'package:flutter/widgets.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/models/source_model.dart';

import '../core/services/apis/api_manger.dart';
import '../models/category_data.dart';

class mainProvider extends ChangeNotifier{
  CategoryData? categoryData;
  int selectedtab=0;
  TextEditingController controller = TextEditingController();




  Sources? source;
  List<Sources>? sources = [];
  List<Article> article =[];

  onCategoryClicked(value){
    categoryData =value;
    notifyListeners();
  }

  Future getSources(String id)async {
     var data = await ApiManger.getsource(id??"");
     sources = data.sources  ;
     notifyListeners();
  }



  void search()async {
    if (source != null) {
      var response = await ApiManger.search(
          source!.id ?? "ABC News", controller.text);
      article = response.articles;
      notifyListeners();
    } else {
      print("Source is null");
    }
  }
}