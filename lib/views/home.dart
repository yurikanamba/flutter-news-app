import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
//categories
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/helper/data.dart';
//news
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/helper/news.dart';

import 'article_view.dart';
import 'category_news.dart';

import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();

  bool _loading = true;

  @override
  void initState() {
    //whenever screen opens, functions in here will be called
    super.initState();
    //from data.dart
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("CC"),
            Text(
              "Interestings",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    /// Categories
                    Container(
                      height: 70,
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              imageUrl: categories[index].imageUrl,
                              categoryName: categories[index].categoryName,
                              id: categories[index].id,
                            );
                          }),
                    ),

                    /// NewsTile
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
                              publishedAt: articles[index].publishedAt,
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

//each tile
class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName, id;
  CategoryTile({this.imageUrl, this.categoryName, this.id});
  @override
  Widget build(BuildContext context) {
    //when you click on widget, you can perform a function
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNews(
                      category: id,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              //centers children in the container
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  final String imageUrl, title, description, url, source, publishedAt;
  NewsTile({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
    @required this.url,
    @required this.source,
    @required this.publishedAt,
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
        margin: EdgeInsets.only(bottom: 16),
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
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              description,
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              source,
              style: TextStyle(
                color: Colors.green,
              ),
            ),
            Text(
              publishedAt,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
