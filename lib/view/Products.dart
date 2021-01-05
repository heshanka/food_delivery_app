import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(catName),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  size: 25,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cart(),
                  ),
                ),
              ),
              // Align(
              //   alignment: Alignment(-1, -1),
              //   child: Container(
              //     width: 20,
              //     decoration:
              //         BoxDecoration(shape: BoxShape.circle, color: Colors.red),
              //   ),
              // )
            ],
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
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: getProductCardList(),
            ),
          ),
        ],
      ),
    );
  }
}
