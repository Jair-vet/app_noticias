import 'package:flutter/material.dart';
import 'package:notificaciones/src/models/category_model.dart';
import 'package:notificaciones/src/models/news_models.dart';
import 'package:http/http.dart' as http;


class NewsService with ChangeNotifier{

  List<Article> headlines = [];

  List<Category> categories =[

  ];


  NewsService(){
    this.getTopHeadlines();
  }

  getTopHeadlines() async {
    
    final uri = Uri.parse("https://newsapi.org/v2/top-headlines?country=mx&apiKey=3739e2bda7cf4d99b4a1a6df98e846a3");

    final resp = await http.get(uri);
    final newsResponse = NewsResponse.fromJson(resp.body);
 
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();

  }



}