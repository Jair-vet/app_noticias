import 'package:flutter/material.dart';
import 'package:notificaciones/src/models/category_model.dart';
import 'package:notificaciones/src/services/news_sercive.dart';
import 'package:notificaciones/src/theme/tema.dart';
import 'package:notificaciones/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';


class Tab2Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final newsService =  Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            
             _ListaCategorias(),

             Expanded(
               child: ListaNoticias( newsService.getArticulosCategoriaSeleccionada! )
             ),
             

          ],
        )
       ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index){

          final cName = categories[index].name;

          return Container(
            //width: 90,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  _CategoryButton(categories[index]),
                  SizedBox(height: 5,),
                  Text('${ cName[0].toUpperCase() }${ cName.substring(1) }'), // Poner en Mayusculas 
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
 
  final Category categoria;
  const _CategoryButton( this.categoria);

  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsService>(context);
    return GestureDetector(
      onTap: (){
        final newService = Provider.of<NewsService>(context, listen: false);
        newService.selectedCategory = categoria.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white24,
        ),
        child: Icon(
          categoria.icon,
          color: (newService.selectedCategory == this.categoria.name)
            ? Colors.tealAccent
            : Colors.black54,
        ),
      ),
    );
  }
}