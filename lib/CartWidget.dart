import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/CartModel.dart';
import 'package:food_delivery_app/controller/MainModel.dart';
import 'package:scoped_model/scoped_model.dart';

import 'Utils.dart';

class CartWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double scaleFactor = Utils.getScreenWidth(context) / Utils.pWidth;
    return ScopedModel(
      model: MainModel.getCartModel(),
      child: Container(
        width: 32 * scaleFactor,
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.only(top: 4.0 * scaleFactor),
            child: Icon(
              Icons.shopping_cart,
              size: 25 * scaleFactor,
            ),
          ),
          ScopedModelDescendant<CartModel>(
              builder: (context, child, model) =>  Visibility(
              visible: model.getTotalCartQuantity() > 0,
                child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 15 * scaleFactor,
                  height: 15 * scaleFactor,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Color(0xfffdb827)),
                  child: Center(
                    child: Text(
                        model.getTotalCartQuantity().toString(),
                        style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                        textScaleFactor: scaleFactor,
                      ),
                    ),
                  ),
                ),
              ),
          ),
        ]),
      ),
    );
  }
}
