import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/Product.dart';
import '../controller/CartModel.dart';
import '../controller/MainModel.dart';
import 'package:scoped_model/scoped_model.dart';

class CartItem extends StatelessWidget {
  final Product product;

  CartItem(this.product);

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: MainModel.getCartModel(),
      child: Column(
        children: [
          Container(
            height: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ScopedModelDescendant<CartModel>(
                  builder: (context, child, model) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            model.addToCart(product.id, quantity: 1);
                          },
                          child: Icon(Icons.add_circle)),
                      Text(model.getProductQuantity(product.id).toString()),
                      InkWell(
                          onTap: () {
                            model.removeFromCart(product.id, quantity: 1);
                          },
                          child: Icon(Icons.remove_circle)),
                    ],
                  ),
                ),
                CachedNetworkImage(
                  placeholder: (context, url) =>
                      Container(
                    child: Image.asset(
                      "assets/edited.gif",
                    ),
                  ), //,
                  imageUrl: product.imgURL,
                  width: 100,
                  height: 120,
                ),
                Text(
                  "\$" + product.price.toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
