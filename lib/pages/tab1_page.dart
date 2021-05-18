import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:noticias_app/widgets/news_list.dart';
import 'package:noticias_app/services/news_service.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context)  {

    final provider = Provider.of<NewsService>(context);
    provider.getTopHeadlines();

    return Scaffold(
      body: (provider.headlines.length == 0)
        ? Center(child: CircularProgressIndicator())
        : NewsList(provider.headlines)
    );
  }

  @override
  bool get wantKeepAlive => true;
}
