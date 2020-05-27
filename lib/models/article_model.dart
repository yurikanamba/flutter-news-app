class ArticleModel {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;
  String source;
  String publishedAt;

//  ArticleModel({String author, String title, String description, String url, String urlToImage, String content, String source, String publishedAt}){
//    this.author = author;
//    this.title = title;
//    this.description = description;
//    this.url = url;
//    this.urlToImage = urlToImage;
//    this.content = content;
//    this.source = source;
//    this.publishedAt = publishedAt;
//  };

  ArticleModel({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.content,
    this.source,
    this.publishedAt,
  });
}
