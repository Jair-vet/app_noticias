import 'package:flutter/material.dart';
import 'package:notificaciones/src/models/news_models.dart';

final _URL_NEWS = "https://newsapi.org/v2";
final _APIKEY = "3739e2bda7cf4d99b4a1a6df98e846a3";

class NewsService with ChangeNotifier{


  List<Article> headlines = [];

  NewsService(){

    this.getTopHeadlines();
  }


  getTopHeadlines(){
    
    final url = "/top-headlines?country=ca&apiKey=3739e2bda7cf4d99b4a1a6df98e846a3";

  }



}