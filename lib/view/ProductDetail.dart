import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/FavoritesModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../CartWidget.dart';
import '../controller/CartModel.dart';
import '../controller/MainModel.dart';
import 'package:scoped_model/scoped_model.dart';
import '../model/Product.dart';
import 'Cart.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  ProductDetail(this.product);
  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.only(top: 8.0, right: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 45,
                  height: 20,
                  child: ScopedModel(
                    model: MainModel.getFavoritesModel(),
                    child: ScopedModelDescendant<FavoritesModel>(
                      builder: (context, child, model) => InkWell(
                        onTap: () async {
                          model.favProductList.contains(product)
                              ? model.removeFromFavorites(
                                  product.id, await prefs)
                              : model.addToFavorites(product.id, await prefs);
                        },
                        child: Icon(
                          Icons.favorite,
                          size: 40,
                          color: model.favProductList.contains(product)
                              ? Colors.red
                              : Colors.grey,
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
            child: CachedNetworkImage(
              placeholder: (context, url) => 
              Container(
                    child: Image.asset(
                      "assets/edited.gif",
                    ),
                  ),//,
              imageUrl: product.imgURL,
              width: 300,
              height: 260,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 8.0),
            child: Text(
              product.name,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$" + product.price.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ScopedModel(
                  model: MainModel.getCartModel(),
                  child: ScopedModelDescendant<CartModel>(
                    builder: (context, child, model) => Row(
                      children: [
                        InkWell(
                          onTap: () {
                            model.removeFromCart(product.id);
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Color(0xfffdb827),
                                borderRadius: BorderRadius.circular(5)),
                            child: Icon(Icons.remove),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                            model.getProductQuantity(product.id).toString(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            model.addToCart(product.id);
                          },
                          child: Container(
                            width: 30,
                            height: 30,
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
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Text(
              product.description,
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
