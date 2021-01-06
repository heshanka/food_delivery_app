import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controller/FavoritesModel.dart';
import '../controller/MainModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favorites extends StatelessWidget {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    MainModel.getFavoritesModel().getFavProductCardList();
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
              builder: (context, child, model) {
                return Expanded(
                  child: GridView.count(
                      childAspectRatio: 0.725,
                      primary: false,
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children:model.cardList),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
