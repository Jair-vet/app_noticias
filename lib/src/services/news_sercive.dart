import 'package:flutter/material.dart';
import 'package:notificaciones/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = "https://newsapi.org/v2";
final _APIKEY = "3739e2bda7cf4d99b4a1a6df98e846a3";

class NewsService with ChangeNotifier{


  List<Article> headlines = [];

  NewsService(){

    this.getTopHeadlines();
  }


  getTopHeadlines() async {
    
    final uri = Uri.parse("https://newsapi.org/v2/top-headlines?country=ca&apiKey=3739e2bda7cf4d99b4a1a6df98e846a3");

    final resp = await http.get(uri);
    final newsResponse = newsResponseFromJson(resp.body);
 
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();

  }



}