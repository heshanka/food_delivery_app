import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/CartModel.dart';
import 'package:food_delivery_app/controller/MainModel.dart';
import 'package:food_delivery_app/view/CartItem.dart';
import 'package:scoped_model/scoped_model.dart';
import '../Utils.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double scaleFactor = Utils.getScreenWidth(context) / Utils.pWidth;
    return ScopedModel(
      model: MainModel.getCartModel(),
      child: Scaffold(
          appBar: AppBar(
            title: Text("My Cart"),
            actions: [
              ScopedModelDescendant<CartModel>(
                  builder: (context, child, model) => IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        model.emptyCart();
                      }))
            ],
          ),
          body: ScopedModelDescendant<CartModel>(
              builder: (context, child, model) => model
                      .productMap.keys.isNotEmpty
                  ? Stack(
                      children: [
                        ListView.builder(
                            itemCount: model.productMap.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CartItem(
                                  model.productMap.keys.elementAt(index));
                            }),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: [
                              Container(
                                width: Utils.getScreenWidth(context) / 2,
                                height: 50 * scaleFactor,
                                color: Color(0xffffb80e),
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Total: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: "\$" +
                                                model
                                                    .getTotalCartPrice()
                                                    .toStringAsFixed(2),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    textScaleFactor: scaleFactor,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => showSuccessDialog(context),
                                child: Container(
                                    width: Utils.getScreenWidth(context) / 2,
                                    height: 50 * scaleFactor,
                                    child: Center(
                                        child: Text("CONFIRM ORDER",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))),
                                    color: Color(0xfffd4d27)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Image.asset("assets/emptycart.png",
                          width: 200 * scaleFactor,
                          height: 200 * scaleFactor)))),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            FlatButton(
              child: Text("Done"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.done_all,
                color: Color(0xfffd4d27),
                size: Utils.getScreenWidth(context) / 6,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 12.0),
                child: Text(
                  "Success!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ),
              Text(
                "Your Order has been received",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        );
      },
    );
  }
}
