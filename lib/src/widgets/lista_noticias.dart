import 'package:flutter/material.dart';
import 'package:notificaciones/src/models/news_models.dart';

class ListaNoticias extends StatelessWidget {

  final List<Article> noticias;
  const ListaNoticias( this.noticias);


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.noticias.length,
      itemBuilder: (BuildContext context, int index){
        return Text(this.noticias[index].title);
      }
    );
  }


}

class _Noticia extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}