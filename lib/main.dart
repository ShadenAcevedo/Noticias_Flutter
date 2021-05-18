import 'package:flutter/material.dart';
import 'package:noticias_app/pages/tabs_page.dart';
import 'package:noticias_app/services/news_service.dart';
import 'package:noticias_app/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: miTema,
        home: TabsPage()
      ),
    );
  }
}
