import 'package:flutter/material.dart';
import 'package:notificaciones/src/services/news_sercive.dart';
import 'package:notificaciones/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';


class Tab1Screen extends StatefulWidget {

  @override
  _Tab1ScreenState createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen>  with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {

    final headlines = Provider.of<NewsService>(context).headlines;
    // newsService.headlines;
    // ListaNoticias(headlines)

    return Scaffold(
      body: (headlines.length == 0)
        ? Center(child: CircularProgressIndicator())
        : ListaNoticias(headlines)
    );
  }

  @override
  bool get wantKeepAlive => true;
}