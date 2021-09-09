import 'package:flutter/material.dart';
import 'package:notificaciones/src/services/news_sercive.dart';
import 'package:notificaciones/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';


class Tab1Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final headlines = Provider.of<NewsService>(context).headlines;
    // newsService.headlines;

    return Scaffold(
      body: ListaNoticias(headlines)
   );
  }
}