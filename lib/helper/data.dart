import 'package:newsapp/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();

  categoryModel = new CategoryModel();
  categoryModel.id = "ars-technica";
  categoryModel.categoryName = "Ars Technica";
  categoryModel.description =
      "The PC enthusiast's resource. Power users and the tools they love, without computing religion.";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categoryModel.color = "redAccent";
  category.add(categoryModel);

  //2
  categoryModel = new CategoryModel();
  categoryModel.id = "crypto-coins-news";
  categoryModel.categoryName = "Crypto Coins News";
  categoryModel.description =
      "Providing breaking cryptocurrency news - focusing on Bitcoin, Ethereum, ICOs, blockchain technology, and smart contracts.";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categoryModel.color = "pinkAccent";
  category.add(categoryModel);

  //3
  categoryModel = new CategoryModel();
  categoryModel.id = "engadget";
  categoryModel.categoryName = "Engadget";
  categoryModel.description =
      "Engadget is a web magazine with obsessive daily coverage of everything new in gadgets and consumer electronics.";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categoryModel.color = "purpleAccent";
  category.add(categoryModel);

  //4
  categoryModel = new CategoryModel();
  categoryModel.id = "hacker-news";
  categoryModel.categoryName = "Hacker News";
  categoryModel.description =
      "Hacker News is a social news website focusing on computer science and entrepreneurship. It is run by Paul Graham's investment fund and startup incubator, Y Combinator. In general, content that can be submitted is defined as \"anything that gratifies one's intellectual curiosity\".";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categoryModel.color = "indigoAccent";
  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.id = "recode";
  categoryModel.categoryName = "Recode";
  categoryModel.description =
      "Get the latest independent tech news, reviews and analysis from Recode with the most informed and respected journalists in technology and media.";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categoryModel.color = "blueAccent";
  category.add(categoryModel);

  //6
  categoryModel = new CategoryModel();
  categoryModel.id = "techcrunch";
  categoryModel.categoryName = "TechCrunch";
  categoryModel.description =
      "TechCrunch is a leading technology media property, dedicated to obsessively profiling startups, reviewing new Internet products, and breaking tech news.";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categoryModel.color = "cyanAccent";
  category.add(categoryModel);

  //7
  categoryModel = new CategoryModel();
  categoryModel.id = "techradar";
  categoryModel.categoryName = "TechRadar";
  categoryModel.description =
      "The latest technology news and reviews, covering computing, home entertainment systems, gadgets and more.";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categoryModel.color = "greenAccent";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.id = "the-next-web";
  categoryModel.categoryName = "The Next Web";
  categoryModel.description =
      "The latest technology news and reviews, covering computing, home entertainment systems, gadgets and more.";
  categoryModel.imageUrl =
      "The Next Web is one of the world’s largest online publications that delivers an international perspective on the latest news about Internet technology, business and culture.";
  categoryModel.color = "yellowAccent";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.id = "the-verge";
  categoryModel.categoryName = "The Verge";
  categoryModel.description =
      "The Verge covers the intersection of technology, science, art, and culture.";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categoryModel.color = "amberAccent";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.id = "wired";
  categoryModel.categoryName = "Wired";
  categoryModel.description =
      "The latest technology news and reviews, covering computing, home entertainment systems, gadgets and more.";
  categoryModel.imageUrl =
      "Wired is a monthly American magazine, published in print and online editions, that focuses on how emerging technologies affect culture, the economy, and politics.";
  categoryModel.color = "orangeAccent";
  category.add(categoryModel);

  return category;
}
