import 'package:flutter/material.dart';
import '../controller/MainModel.dart';
import '../model/Category.dart';
import '../view/CategoryCard.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
    return ScopedModel(
      model: model,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
            padding: EdgeInsets.only(top: 25.0 * scaleFactor, bottom: 16.0 * scaleFactor),
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
                // Container(
                //   width: 170,
                //   height: 30,
                //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color(0xfff6f6f6)),
                //   child: Center(child:Text("Set delivery address >", 
                //   style: TextStyle(fontSize: 13, color: Colors.black),),),),
              ],
            ),
          ),
            Padding(
              padding: EdgeInsets.only(left: 16 * scaleFactor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   "Foodiez!",
                  //   style: GoogleFonts.alegreya(
                  //       fontSize: 32,
                  //       color: Colors.black,
                  //       fontWeight: FontWeight.normal),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 16.0),
                  //   child: Text(
                  //     "Today's Deals",
                  //     style:
                  //         TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  //   )
                  // ),
                  Container(
                    height: 200 * scaleFactor,
                    child: Swiper(
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
                    padding: EdgeInsets.only(top: 16.0 * scaleFactor, left: 8 * scaleFactor),
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
            Expanded(
              child: GridView.count(
                primary: false,
                padding: EdgeInsets.all(20 * scaleFactor),
                crossAxisSpacing: 10 * scaleFactor,
                mainAxisSpacing: 10 * scaleFactor,
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                children: returnCategoryCardList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
