import 'package:flutter/material.dart';
import 'package:notificaciones/src/models/category_model.dart';
import 'package:notificaciones/src/models/news_models.dart';
import 'package:http/http.dart' as http;


class NewsService with ChangeNotifier{

  List<Article> headlines = [];
  String _selectedCategory = 'business';

  List<Category> categories =[
    Category(Icons.business, 'business'),
    Category(Icons.tv, 'entertainment'),
    Category(Icons.devices_other, 'general'),
    Category(Icons.health_and_safety, 'health'),
    Category(Icons.science,'science'),
    Category(Icons.sports,'sports'),
    Category(Icons.memory, 'technology'),
  ];

   Map<String, List<Article>> categoryArticles = {};
      
  NewsService() {
    this.getTopHeadlines();

    categories.forEach( (item) {
      this.categoryArticles[item.name] = [];
    });

    this.getArticlesByCategory( this._selectedCategory );
  }



  String get selectedCategory => this._selectedCategory;
  set selectedCategory( String valor ) {
    this._selectedCategory = valor;

    this.getArticlesByCategory( valor );
    notifyListeners();
  }

  List<Article>? get getArticulosCategoriaSeleccionada => this.categoryArticles[this.selectedCategory];
  getTopHeadlines() async {
    
    final uri = Uri.parse("https://newsapi.org/v2/top-headlines?country=mx&apiKey=3739e2bda7cf4d99b4a1a6df98e846a3");

    final resp = await http.get(uri);
    final newsResponse = NewsResponse.fromJson(resp.body);
 
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();

  }

  getArticlesByCategory(String category)async{
    if( this.categoryArticles[category]!.length >0){
      return this.categoryArticles[category];
    }
    final uri = Uri.parse("https://newsapi.org/v2/top-headlines?country=mx&apiKey=3739e2bda7cf4d99b4a1a6df98e846a3&category=$category");

    final resp = await http.get(uri);
    final newsResponse = NewsResponse.fromJson(resp.body);
 
    this.categoryArticles[category]!.addAll( newsResponse.articles );

    notifyListeners();
  }



}