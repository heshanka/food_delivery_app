import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/MainController.dart';
import 'package:scoped_model/scoped_model.dart';

import '../widgets/CartWidget.dart';
import 'Cart.dart';
import 'Categories.dart';
import 'Favorites.dart';

class Canvas extends StatelessWidget {
  MainController model = MainController();

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
          body: ScopedModelDescendant<MainController>(
            builder: (context, child, model) => pages[model.getSelectedIndex()],
          ),
          bottomNavigationBar: ScopedModelDescendant<MainController>(
              builder: (context, child, model) {
            return BottomNavigationBar(
              items: navbarItems,
              currentIndex: model.getSelectedIndex(),
              selectedItemColor: Color(0xfff84b18),
              onTap: (int i) {
                model.onItemTapped(i);
              },
            );
          })),
    );
  }
}
