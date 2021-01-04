import 'package:flutter/material.dart';
import 'package:food_delivery_app/view/Cart.dart';
import '../model/Product.dart';
import 'ProductCard.dart';

class Products extends StatelessWidget {
  final int catId;
  final String catName;

  Products({this.catId, this.catName});

  List<Product> prodList = [
    Product(
        1,
        "Lentil Soup",
        "",
        12.5,
        1,
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.delishknowledge.com%2Fwp-content%2Fuploads%2Fredlentilsoup2.jpg&f=1&nofb=1",
        true,
        false),
    Product(
        2,
        "Chicken Burger",
        "",
        6.50,
        3,
        "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fghk.h-cdn.co%2Fassets%2F17%2F33%2F1502998809-burger-king-grilled-chicken-sandwich.jpg&f=1&nofb=1",
        true,
        false),
    Product(
        3,
        "Beef Burger",
        "",
        9.20,
        3,
        "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.wendys.co.id%2Fassets%2Fmedia%2Fgroup_product%2Fbeef_deluxe.png&f=1&nofb=1",
        true,
        false),
    //Product(1, "Lentil Soup", "", 12.5, 1, "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.delishknowledge.com%2Fwp-content%2Fuploads%2Fredlentilsoup2.jpg&f=1&nofb=1", true, false),
  ];

  List<ProductCard> getProductCardList() {
    List<ProductCard> productList = [];
    for (Product p in prodList) {
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
