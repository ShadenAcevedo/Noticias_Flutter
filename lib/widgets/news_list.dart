import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noticias_app/models/news_models.dart';
import 'package:noticias_app/theme/theme.dart';

class NewsList extends StatelessWidget {

  final List<Article> noticias;

  const NewsList(this.noticias);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.noticias.length,
      itemBuilder: (context, int index){
        return _New(noticia: this.noticias[index], index: index);
      }
    );
  }
}

class _New extends StatelessWidget {

  final Article noticia;
  final int index;

  const _New({ required this.noticia, required this.index});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CardTopBar(noticia, index),
        _CardTitle(noticia),
        _CardImage(noticia),
        _CardBody(noticia),
        _CardButtons(),
        Divider(height: 40)
      ],
    );
  }
}

class _CardTopBar extends StatelessWidget {

  final Article noticia;
  final int index;

  const _CardTopBar(this.noticia, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${index + 1}. ', style: TextStyle(color: miTema.accentColor)),
          Text('${noticia.source!.name}. '),
        ],
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {

  final Article noticia;

  const _CardTitle(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(noticia.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
    );
  }
}

class _CardImage extends StatelessWidget {

  final Article noticia;

  const _CardImage(this.noticia);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: 300,
        child: (noticia.urlToImage != '')
        ? FadeInImage(
            placeholder: AssetImage('assets/img/giphy.gif'),
            image: NetworkImage(noticia.urlToImage)
        )
        : Image(image: AssetImage('assets/img/no-image.png'))
      ),
    );
  }
}

class _CardBody extends StatelessWidget {

  final Article noticia;

  const _CardBody(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Text((noticia.description != '') ? noticia.description : '' ),
    );
  }
}

class _CardButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: (){},
            fillColor: Colors.red,
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(20)),
            child: Icon(Icons.star_border),
          ),
          SizedBox(width: 10),
          RawMaterialButton(
            onPressed: (){},
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(20)),
            child: Icon(Icons.arrow_forward_outlined),
          ),
        ],
      ),
    );
  }
}




