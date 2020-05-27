import 'dart:convert';
import 'package:newsapp/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:newsapp/models/source_model.dart';

//fetch all technology headlines
class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=ba6018a0c29b4508be8a24c16e933a85";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          //pass into Article Model Class
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['context'],
            source: element['source']['name'],
            publishedAt: element['publishedAt'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}

//fetch news based on source
class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?sources=$category&apiKey=ba6018a0c29b4508be8a24c16e933a85";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['context'],
          );

          news.add(articleModel);
        }
      });
    }
  }
}

//fetch tech sources
class Sources {
  List<SourceModel> sources = [];

  Future<void> getSources() async {
    String url =
        "https://newsapi.org/v2/sources?category=technology&language=en&apiKey=ba6018a0c29b4508be8a24c16e933a85";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["sources"].forEach((element) {
        SourceModel sourceModel = SourceModel(
          name: element['name'],
          description: element['description'],
        );
        sources.add(sourceModel);
      });
    }
  }
}
