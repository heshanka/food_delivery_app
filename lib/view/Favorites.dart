import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utils.dart';
import '../controller/FavoritesModel.dart';
import '../controller/MainModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favorites extends StatelessWidget {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    double scaleFactor = Utils.getScreenWidth(context) / Utils.pWidth;
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
                return model.cardList.isNotEmpty
                    ? Expanded(
                        child: GridView.count(
                            childAspectRatio: 0.725,
                            primary: false,
                            padding: EdgeInsets.only(
                                left: 10 * scaleFactor, right: 10 * scaleFactor, top: 10 * scaleFactor),
                            crossAxisSpacing: 10 * scaleFactor,
                            mainAxisSpacing: 10 * scaleFactor,
                            crossAxisCount: 2,
                            children: model.cardList),
                      )
                    : Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/3.5,
                      left: 16, right: 16),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/brokenheart.png", width: 100 * scaleFactor, height: 100 * scaleFactor,),
                            Text(
                              "Please browse our products to find what you like",
                              style: GoogleFonts.meddon(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal), textAlign: TextAlign.center,
                              textScaleFactor: scaleFactor,
                            ),
                          ],
                        ),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
