import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/MainModel.dart';
import 'package:food_delivery_app/model/Category.dart';
import 'package:food_delivery_app/view/CategoryCard.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatelessWidget {
  final MainModel model = MainModel();

  List<Category> categoryList = [
    Category(1, "Soups",
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.villagecoffee.biz%2Fwp-content%2Fuploads%2F2017%2F01%2FSoup_Tomato.png&f=1&nofb=1"),
    Category(2, "Pizza",
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fredgrasshopper.com.au%2Fwp-content%2Fuploads%2F2019%2F05%2Fpizza.png&f=1&nofb=1"),
    Category(3, "Burgers",
        "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Ffreepngimages.com%2Fwp-content%2Fuploads%2F2016%2F11%2Fbacon-burger.png&f=1&nofb=1"),
    Category(4, "Chinese",
        "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.hertfordshirekarate.co.uk%2Fwp-content%2Fuploads%2F2017%2F01%2Fchinese-food.png&f=1&nofb=1"),
  ];

  List<Widget> returnCategoryCardList() {
    List<CategoryCard> cardlist = [];
    for (Category cat in categoryList) {
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
