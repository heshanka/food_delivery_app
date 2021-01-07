import 'package:flutter/material.dart';
import 'package:food_delivery_app/CartWidget.dart';
import 'package:food_delivery_app/view/Cart.dart';
import '../Utils.dart';
import '../model/Product.dart';
import 'ProductCard.dart';

class Products extends StatelessWidget {
  final int catId;
  final String catName;

  Products({this.catId, this.catName});

  List<ProductCard> getProductCardList() {
    List<ProductCard> productList = [];
    for (Product p in Utils.productList) {
      if (p.categoryId == catId) {
        productList.add(ProductCard(p));
      }
    }
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    double scaleFactor = Utils.getScreenWidth(context) / Utils.pWidth;
    return Scaffold(
      appBar: AppBar(
        title: Text(catName),
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
          Expanded(
            child: GridView.count(
              childAspectRatio: 0.725,
              primary: false,
              padding: EdgeInsets.only(left: 10 * scaleFactor, right: 10 * scaleFactor, top: 10 * scaleFactor),
              crossAxisSpacing: 10 * scaleFactor,
              mainAxisSpacing: 10 * scaleFactor,
              crossAxisCount: 2,
              children: getProductCardList(),
            ),
          ),
        ],
      ),
    );
  }
}
