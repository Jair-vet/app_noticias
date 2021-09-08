
import 'package:flutter/material.dart';
import 'package:notificaciones/src/pages/tabs_page.dart';
import 'package:notificaciones/src/services/news_sercive.dart';
import 'package:notificaciones/src/theme/tema.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_) => new  NewsService() )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: miTema,
        title: 'Material App',
        home: TabsPage(),
        
      ),
    );
  }
}