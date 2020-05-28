//import 'package:cached_network_image/cached_network_image.dart';
//import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
//sources
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/helper/data.dart';
import 'category_news.dart';
//news
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/helper/news.dart';
import 'article_view.dart';
//spinner
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatefulWidget {
  //override the class defined in Stateful Widget
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
        title: Text('TechInt ⌘ 💻', style: TextStyle(color: Colors.tealAccent)),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: Container(
                //loading spinner
                child: SpinKitFadingCircle(
                  color: Colors.teal,
                  size: 50.0,
                ),
                //CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: <Widget>[
                    /// Sources
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 16.0),
                      height: 70,
                      //padding: EdgeInsets.symmetric(horizontal: 0),
                      child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              imageUrl: categories[index].imageUrl,
                              categoryName: categories[index].categoryName,
                              id: categories[index].id,
                              color: categories[index].color,
                            );
                          }),
                    ),

                    /// All News
                    Container(
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
  final String imageUrl, categoryName, id, color;
  CategoryTile({this.imageUrl, this.categoryName, this.id, this.color});
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
                      categoryName: categoryName,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
//              child: CachedNetworkImage(
//                imageUrl: imageUrl,
//                width: 120,
//                height: 60,
//                fit: BoxFit.cover,
//              ),
            ),
            Container(
              //centers children in the container
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.tealAccent[700],
              ),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  categoryName,
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
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
      //maybe use cards to design each news tile
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    alignment: Alignment.center,
                    width: 130,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.tealAccent[700],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        source,
                        style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    alignment: Alignment.center,
                    width: 180,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.tealAccent[700],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        publishedAt,
                        style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
