import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/FavoritesModel.dart';
import '../controller/CartModel.dart';
import '../controller/MainModel.dart';
import '../model/Product.dart';
import 'ProductDetail.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double imgWidth;
  final double imgHeight;

  ProductCard(this.product, {this.imgWidth = 150, this.imgHeight = 130});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(product),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 8,
        ),
        decoration: BoxDecoration(
            color: Color(0xfff5f4f4),
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScopedModel(
                model: MainModel.getFavoritesModel(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ScopedModelDescendant<FavoritesModel>(
                      builder: (context, child, model) => Container(
                        width: 45,
                        height: 20,
                        child: InkWell(
                          onTap: () {
                            model.favList.contains(product)
                                ? model.removeFromFavorites(product.id)
                                : model.addToFavorites(product.id);
                          },
                          child: Icon(
                            Icons.favorite,
                            size: 30,
                            color: model.favList.contains(product)
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
              CachedNetworkImage(
                placeholder: (context, url) => CircularProgressIndicator(), //,
                imageUrl: product.imgURL,
                width: imgWidth,
                height: imgHeight,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  product.name,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                child: Text(
                  product.price.toString() + "USD",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ScopedModel(
                model: MainModel.getCartModel(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ScopedModelDescendant<CartModel>(
                      builder: (context, child, model) => InkWell(
                        onTap: () {
                          model.addToCart(product.id, quantity: 1);
                        },
                        child: Container(
                          width: 45,
                          height: 42,
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
