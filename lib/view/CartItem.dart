import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/Product.dart';
import '../Utils.dart';
import '../controller/CartModel.dart';
import '../controller/MainModel.dart';
import 'package:scoped_model/scoped_model.dart';

class CartItem extends StatelessWidget {
  final Product product;

  CartItem(this.product);

  @override
  Widget build(BuildContext context) {
    double scaleFactor = Utils.getScreenWidth(context) / Utils.pWidth;
    return ScopedModel(
      model: MainModel.getCartModel(),
      child: Column(
        children: [
          Container(
            height: 130 * scaleFactor,
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
                          child: Container(
                            width: 24,
                            height: 24,
                            child: Icon(Icons.add, size: 18,),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                          color: Color(0xffdbdbdb),
                          ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(top:8.0, bottom: 8.0),
                        child: Text(model.getProductQuantity(product.id).toString(),
                        style: TextStyle(fontSize: 16),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            model.removeFromCart(product.id, quantity: 1);
                          },
                          child: Container(
                            width: 24,
                            height: 24,
                            child: Icon(Icons.remove, size: 18,),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                          color: Color(0xffdbdbdb),
                          ),),
                      )],
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
                  width: 100 * scaleFactor,
                  height: 120 * scaleFactor,
                ),
                Text(
                  "\$" + Utils.numFormat.format(product.price),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textScaleFactor: scaleFactor,
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            indent: 20 * scaleFactor,
            endIndent: 20 * scaleFactor,
          )
        ],
      ),
    );
  }
}
