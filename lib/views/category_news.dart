import 'package:flutter/material.dart';
import 'package:newsapp/helper/news.dart';
import 'package:newsapp/models/article_model.dart';

import 'article_view.dart';
//spinner
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CategoryNews extends StatefulWidget {
  final String category, categoryName;
  CategoryNews({this.category, this.categoryName});

  @override
  //instantiating state object _CategoryNews
  _CategoryNews createState() => _CategoryNews();
}

//within state object, build data that can change over time
class _CategoryNews extends State<CategoryNews> {
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    //whenever screen opens, functions in here will be called
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    //change the value of variable and updates the widget anytime it changes
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TechInt⌘', style: TextStyle(color: Colors.tealAccent)),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: SpinKitFadingCircle(
                  color: Colors.teal,
                  size: 50.0,
                ),
                //CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 15),
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.tealAccent[700],
                        ),
                        child: Text(widget.categoryName,
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 20,
                                fontWeight: FontWeight.w600))),
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                          itemCount: articles.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return NewsTile(
                              imageUrl: articles[index].urlToImage,
                              title: articles[index].title,
                              description: articles[index].description,
                              url: articles[index].url,
                              source: articles[index].source,
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class NewsTile extends StatelessWidget {
  final String imageUrl, title, description, url, source;
  NewsTile({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
    @required this.url,
    @required this.source,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      articleUrl: url,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 25),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[300],
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              description,
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
