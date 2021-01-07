import 'package:flutter/material.dart';
import '../controller/MainModel.dart';
import '../model/Category.dart';
import '../view/CategoryCard.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils.dart';

class Categories extends StatelessWidget {
  final MainModel model = MainModel();

  List<Widget> returnCategoryCardList() {
    List<CategoryCard> cardlist = [];
    for (Category cat in Utils.categoryList) {
      cardlist.add(CategoryCard(cat));
    }
    return cardlist;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: model,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Welcome to",
              style: GoogleFonts.alegreya(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Foodiez!",
                    style: GoogleFonts.alegreya(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      "Categories",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: returnCategoryCardList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
