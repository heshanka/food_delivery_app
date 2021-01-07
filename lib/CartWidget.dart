import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/CartModel.dart';
import 'package:food_delivery_app/controller/MainModel.dart';
import 'package:scoped_model/scoped_model.dart';

class CartWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: MainModel.getCartModel(),
      child: Container(
        width: 32,
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Icon(
              Icons.shopping_cart,
              size: 25,
            ),
          ),
          ScopedModelDescendant<CartModel>(
              builder: (context, child, model) =>  Visibility(
              visible: model.getTotalCartQuantity() > 0,
                child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Color(0xfffdb827)),
                  child: Center(
                    child: Text(
                        model.getTotalCartQuantity().toString(),
                        style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
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
