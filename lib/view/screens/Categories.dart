import 'package:flutter/material.dart';
import '../../controller/MainController.dart';
import '../../model/Category.dart';
import '../widgets/CategoryCard.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:math' as Math;

import '../../Utils.dart';

class Categories extends StatelessWidget {
  final MainController model = MainController();

  List<Widget> returnCategoryCardList() {
    //MainModel.getFavoritesModel().getFavProductCardList();
    List<CategoryCard> cardlist = [];
    for (Category cat in Utils.categoryList) {
      cardlist.add(CategoryCard(cat));
    }
    return cardlist;
  }

  List<Widget> lw = [
    Image.asset(
      "assets/pizzacamp.png",
    ),
    Image.asset(
        "assets/test.png",
      ),
    Image.asset(
      "assets/madefresh.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double scaleFactor = Utils.getScreenWidth(context) / Utils.pWidth;
    MainController.getFavoritesModel().getFavProductCardList();
    return ScopedModel(
      model: model,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
          top: 25.0 * scaleFactor, bottom: 16.0 * scaleFactor),
                child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Welcome to Foodiez!",
            style: GoogleFonts.meddon(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.normal),
            textScaleFactor: scaleFactor,
          ),
        ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16 * scaleFactor),
                child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200 * scaleFactor,
            child: Swiper(
              curve: Curves.easeInOut,
              autoplay: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: lw[index],
                );
              },
              itemCount: lw.length,
              pagination: new SwiperPagination(
                  builder: SwiperPagination.dots,
                  margin: EdgeInsets.all(5)),
              control: new SwiperControl(size: 20),
              //containerHeight: 150,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 16.0 * scaleFactor, left: 8 * scaleFactor),
            child: Text(
              "Categories",
              style: GoogleFonts.courgette(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
              textScaleFactor: scaleFactor,
            ),
          ),
        ],
                ),
              ),
              GridView.count(
        primary: false,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(20 * scaleFactor),
        crossAxisSpacing: 10 * scaleFactor,
        mainAxisSpacing: 10 * scaleFactor,
        crossAxisCount: 2,
        childAspectRatio: 0.9,
        children: returnCategoryCardList(),
              ),
            ],
          ),
      ),
    );
  }
}
