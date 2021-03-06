import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/FavoritesController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Utils.dart';
import '../../controller/CartController.dart';
import '../../controller/MainController.dart';
import '../../model/Product.dart';
import '../screens/ProductDetail.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double imgWidth;
  final double imgHeight;

  ProductCard(this.product, {this.imgWidth = 150, this.imgHeight = 130});

  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    double scaleFactor = Utils.getScreenWidth(context) / Utils.pWidth;
    return InkWell(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(30)),
      onTap: () {
        Navigator.of(context).push(_createRoute(product));
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 8 * scaleFactor,
        ),
        decoration: BoxDecoration(
            color: Color(0xfff5f4f4),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(30))),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScopedModel(
                model: MainController.getFavoritesModel(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ScopedModelDescendant<FavoritesModel>(
                      builder: (context, child, model) => Container(
                        width: 45 * scaleFactor,
                        height: 20 * scaleFactor,
                        child: InkWell(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(30)),
                          onTap: () async {
                            model.favProductList.contains(product)
                                ? model.removeFromFavorites(
                                    product.id, await prefs)
                                : model.addToFavorites(product.id, await prefs);
                          },
                          child: Icon(
                            Icons.favorite,
                            size: 30 * scaleFactor,
                            color: model.favProductList.contains(product)
                                ? Colors.red
                                : Colors.grey,
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Hero(
                  tag: product.heroTag,
                  child: CachedNetworkImage(
                      placeholder: (context, url) => Container(
                            child: Image.asset(
                              "assets/edited.gif",
                            ),
                          ), //,
                      imageUrl: product.imgURL,
                      height: imgHeight * scaleFactor),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0 * scaleFactor),
                child: Text(
                  product.name,
                  style: TextStyle(fontSize: 16),
                  textScaleFactor: scaleFactor,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 8.0 * scaleFactor, left: 8.0 * scaleFactor),
                child: Text(
                  "\$" +
                      Utils.numFormat.format(
                          product.price), //product.price.toStringAsFixed(2),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textScaleFactor: scaleFactor,
                ),
              ),
              ScopedModel(
                model: MainController.getCartModel(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ScopedModelDescendant<CartController>(
                      builder: (context, child, model) => InkWell(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(30)),
                        onTap: () {
                          model.addToCart(product.id, quantity: 1);
                        },
                        child: Container(
                          width: 45 * scaleFactor,
                          height: 45 * scaleFactor,
                          child: Icon(Icons.add_shopping_cart_rounded),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(30)),
                              color: Color(0xfffdb827)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
        //color: Colors.teal[100],
      ),
    );
  }
}

Route _createRoute(Product product) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        ProductDetail(product),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
