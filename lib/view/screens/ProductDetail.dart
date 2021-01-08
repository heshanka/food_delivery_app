import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/FavoritesController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/CartWidget.dart';
import '../../Utils.dart';
import '../../controller/CartModel.dart';
import '../../controller/MainController.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../model/Product.dart';
import 'Cart.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  ProductDetail(this.product);
  @override
  Widget build(BuildContext context) {
    double scaleFactor = Utils.getScreenWidth(context) / Utils.pWidth;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: [
          IconButton(
            icon: CartWidget(),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Cart(),
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: 8.0 * scaleFactor, right: 12.0 * scaleFactor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 45 * scaleFactor,
                  height: 45 * scaleFactor,
                  child: ScopedModel(
                    model: MainController.getFavoritesModel(),
                    child: ScopedModelDescendant<FavoritesModel>(
                      builder: (context, child, model) => InkWell(
                        borderRadius: BorderRadius.circular(45),
                        onTap: () async {
                          model.favProductList.contains(product)
                              ? model.removeFromFavorites(
                                  product.id, await prefs)
                              : model.addToFavorites(product.id, await prefs);
                        },
                        child: Center(
                          child: Icon(
                            Icons.favorite,
                            size: 40 * scaleFactor,
                            color: model.favProductList.contains(product)
                                ? Colors.red
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          ),
          Center(
            child: Hero(
              tag: product.heroTag,
              child:    
              CachedNetworkImage(
                placeholder: (context, url) => Container(
                  child: Image.asset(
                    "assets/edited.gif",
                  ),
                ), //,
                imageUrl: product.imgURL,
                width: 300 * scaleFactor,
                height: 260 * scaleFactor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 20.0 * scaleFactor, top: 8.0 * scaleFactor),
            child: Text(
              product.name,
              style: TextStyle(fontSize: 18),
              textScaleFactor: scaleFactor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 20.0 * scaleFactor,
                right: 20.0 * scaleFactor,
                top: 8.0 * scaleFactor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$" + product.price.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textScaleFactor: scaleFactor,
                ),
                ScopedModel(
                  model: MainController.getCartModel(),
                  child: ScopedModelDescendant<CartController>(
                    builder: (context, child, model) => Row(
                      children: [
                        InkWell(
                          onTap: () {
                            model.removeFromCart(product.id);
                          },
                          child: Container(
                            width: 30 * scaleFactor,
                            height: 30 * scaleFactor,
                            decoration: BoxDecoration(
                                color: Color(0xfffdb827),
                                borderRadius: BorderRadius.circular(5)),
                            child: Icon(Icons.remove),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 8.0 * scaleFactor,
                              right: 8.0 * scaleFactor),
                          child: Text(
                            model.getProductQuantity(product.id).toString(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            textScaleFactor: scaleFactor,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            model.addToCart(product.id);
                          },
                          child: Container(
                            width: 30 * scaleFactor,
                            height: 30 * scaleFactor,
                            decoration: BoxDecoration(
                                color: Color(0xfffdb827),
                                borderRadius: BorderRadius.circular(5)),
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 20.0 * scaleFactor,
                left: 20.0 * scaleFactor,
                right: 20.0 * scaleFactor),
            child: Text(
              product.description,
              style: TextStyle(fontSize: 16),
              textScaleFactor: scaleFactor,
            ),
          )
        ],
      ),
    );
  }
}
