import 'package:flutter/material.dart';
import 'package:notificaciones/src/services/news_sercive.dart';
import 'package:provider/provider.dart';


class Tab1Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);


    return Scaffold(
      body: Center(
        child: Text('Hola Mundo'),
     ),
   );
  }
}