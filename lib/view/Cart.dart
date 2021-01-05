import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/CartModel.dart';
import 'package:food_delivery_app/controller/MainModel.dart';
import 'package:food_delivery_app/view/CartItem.dart';
import 'package:scoped_model/scoped_model.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Cart"),
        ),
        body: ScopedModel(
            model: MainModel.getCartModel(),
            child: ScopedModelDescendant<CartModel>(
                builder: (context, child, model) => Stack(
                      children: [
                        ListView.builder(
                            itemCount: model.productMap.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CartItem(
                                  model.productMap.keys.elementAt(index));
                            }),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            color: Color(0xfffdb827),
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  text: 'TOTAL PRICE: ',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: model
                                                .getTotalCartPrice()
                                                .toStringAsFixed(2) +
                                            " USD",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))));
  }
}
