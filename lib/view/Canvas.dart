import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/MainModel.dart';
import 'package:scoped_model/scoped_model.dart';

import '../CartWidget.dart';
import 'Cart.dart';
import 'Categories.dart';
import 'Favorites.dart';

class Canvas extends StatelessWidget {
  MainModel model = MainModel();

  List<Widget> pages = <Widget>[
    Categories(),
    Cart(),
    Favorites(),
  ];

  static List<BottomNavigationBarItem> navbarItems =
      <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: CartWidget(),
      label: "Cart",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: "Favorites",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: model,
      child: Scaffold(
          body: ScopedModelDescendant<MainModel>(
            builder: (context, child, model) => pages[model.getSelectedIndex()],
          ),
          bottomNavigationBar: ScopedModelDescendant<MainModel>(
              builder: (context, child, model) {
            return BottomNavigationBar(
              items: navbarItems,
              currentIndex: model.getSelectedIndex(),
              selectedItemColor: Colors.amber[800],
              onTap: (int i) {
                model.onItemTapped(i);
              },
            );
          })),
    );
  }
}
