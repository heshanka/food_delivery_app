import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/FavoritesModel.dart';
import 'package:food_delivery_app/controller/MainModel.dart';
import 'package:scoped_model/scoped_model.dart';
import '../model/Product.dart';

import '../Utils.dart';
import 'ProductCard.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: ScopedModel(
        model: MainModel.getFavoritesModel(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScopedModelDescendant<FavoritesModel>(
              builder: (context, child, model) => Expanded(
                child: GridView.count(
                  childAspectRatio: 0.725,
                  primary: false,
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: model.getFavList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
