import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noticias_app/models/category_model.dart';
import 'package:noticias_app/services/news_service.dart';
import 'package:noticias_app/theme/theme.dart';
import 'package:noticias_app/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              _CategorysList(),
              Expanded(
                  child: NewsList(provider.articlesCategorySelected)
              )
            ],
          )
      ),
    );
  }
}

class _CategorysList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<NewsService>(context);
    final categories = provider.categories;

    return Container(
      width: double.infinity,
      height: 105,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index){

          final nameCategory = categories[index].name;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                _CategoryButton(categories[index]),
                SizedBox(height: 5),
                Text('${nameCategory[0].toUpperCase()}${nameCategory.substring(1)}')
              ],
            ),
          );
        }
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {

  final Category category;

  const _CategoryButton(this.category);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:(newsService.selectedCategory == this.category.name)
              ? miTema.accentColor
              : Colors.black
        ),
        child: Icon(
          category.icon,
          color: Colors.blue,
        ),
      ),
    );
  }
}

