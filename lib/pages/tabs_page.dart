import 'package:flutter/material.dart';
import 'package:noticias_app/pages/tab1_page.dart';
import 'package:noticias_app/pages/tab2_page.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _NavigationModel with ChangeNotifier{

  int _paginaActual = 0;
  PageController _pageController = PageController();

  int get paginaActual => this._paginaActual;
  set paginaActual(int valor) {
    this._paginaActual = valor;
    _pageController.animateToPage(valor, duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: navigationModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Tab1Page(),
        Tab2Page()
      ],
    );
  }
}

class _Navigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
        currentIndex: navigationModel.paginaActual,
        onTap: (i) => navigationModel.paginaActual = i,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Para ti'),
          BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Encabezados'),
        ]
    );
  }
}


