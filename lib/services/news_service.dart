import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noticias_app/models/category_model.dart';
import 'package:noticias_app/models/news_models.dart';
import 'package:http/http.dart' as http;

final _urlNews = 'https://newsapi.org';
final _apiKey = '0a9f68cc07ce4a359f7acacd8ae0e982';

class NewsService with ChangeNotifier{

  final List<Article> headlines = [];
  final List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.basketballBall, 'sports'),
    Category(FontAwesomeIcons.laptopCode, 'technology'),
  ];

  String _selectedCategory = 'business';
  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    this.getTopHeadlines();
    categories.forEach((element) {
      this.categoryArticles[element.name] = [];
    });
  }

  getTopHeadlines() async{
    final url = Uri.parse('$_urlNews/v2/top-headlines?apiKey=$_apiKey&country=co');
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  String get selectedCategory => this._selectedCategory;

  get articlesCategorySelected => this.categoryArticles[this.selectedCategory];

  set selectedCategory(String valor){
    this._selectedCategory = valor;
    this.getArticlesByCategory(valor);
    notifyListeners();
  }

  getArticlesByCategory(String category) async{

    if(this.categoryArticles[category]!.length > 0 ){
      return this.categoryArticles[category];
    }
    final url = Uri.parse('$_urlNews/v2/top-headlines?apiKey=$_apiKey&country=co&category=$category');
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    this.categoryArticles[category]?.addAll(newsResponse.articles);
    notifyListeners();
  }
}