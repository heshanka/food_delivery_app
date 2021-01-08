import 'package:flutter/material.dart';

import 'model/Category.dart';
import 'model/Product.dart';
import 'package:intl/intl.dart';

class Utils {
  static var numFormat = new NumberFormat("###.00", "en_US");

  static double pWidth = 392.7;

  static List<Category> categoryList = [
    Category(1, "Soups",
        "https://www.villagecoffee.biz/wp-content/uploads/2017/01/Soup_Tomato.png"),
    Category(2, "Pizza",
        "https://pizza-brew.com/wp-content/uploads/2018/11/pp.png"),
    Category(3, "Burgers",
        "http://freepngimages.com/wp-content/uploads/2016/11/bacon-burger.png"),
    Category(4, "Chinese",
        "http://www.hertfordshirekarate.co.uk/wp-content/uploads/2017/01/chinese-food.png"),
  ];
  static List<Product> productList = [
    Product(
      1,
      "Lentil Soup",
      "Thanks to rich lentils and fresh herbs, this soup has all the stick-to-your-ribs heartiness of lentils and cures your hunger. Served with any type of bread you choose. ",
      12.5,
      1,
      "https://menu.indolj.com/upload/1584438166-1553264528-12-Lentil-Soup-\$4.99.jpeg-2.png",
      true,
      "Lentil Soup"
    ),
    Product(
      2,
      "Chicken Burger",
      "Tomato, Worcestershire, and hot sauce gives this burger a tasty kick, topped with some sweet pickle relish, lettuce and cabbage slaw to balance out the spice.",
      6.50,
      3,
      "http://ghk.h-cdn.co/assets/17/33/1502998809-burger-king-grilled-chicken-sandwich.jpg",
      true,
      "Chicken Burger",
    ),
    Product(
      3,
      "Beef Burger",
      "Crisp leaf lettuce and three Roma tomato slices top a ¼ lb.* of 100% fresh beef** that’s cooked when you order and it’s hot and deliciously juicy. Seasoned with just a pinch of salt and pepper and sizzled on our flat iron grill. Layered with two slices of melty American cheese, creamy mayo, slivered onions and tangy pickles on a soft, fluffy sesame seed bun.",
      9.20,
      3,
      "http://www.wendys.co.id/assets/media/group_product/beef_deluxe.png",
      true,
      "Beef Burger",
    ),
    Product(
      4,
      "Cheese Lovers",
      "Rich tomato sauce with a triple layer of mozzarella cheese.",
      5.55,
      2,
      "https://www.cottageinn.com/app/uploads/2014/07/GarlicCheeseBread_sm1.png",
      true,
      "Cheese Lovers",
    ),
    Product(
      5,
      "Fried Rice",
      "Made with your choice of meat, onion, egg, scallions and rice. Choose from: Chicken, Pork, and Shrimp. Combination includes: Chicken, Pork, and Shrimp.",
      8.70,
      4,
      "https://eatchinwa.com/wp-content/uploads/2019/04/Chinwa-Chinwa%E2%80%99s-Fried-Rice-Chicken.png",
      true,
      "Fried Rice",
    ),
    Product(
      6,
      "Dumplings",
      "A delicious filling wrapped in dough and cooked to perfection. And who doesn't love a soft, fluffy steam bun filled with some juicy pork and vegetables",
      10.50,
      4,
      "http://www.bibigo.com/img/en/obj_home1_1.png",
      true,
      "Dumplings",
    ),
    Product(
      7,
      "Pepperoni Pizza",
      "Tomato and cheese goodness with juicy pepperoni",
      7.90,
      2,
      "https://forums.ultra-combo.com/uploads/default/original/2X/8/89674b29f7366334aae4ad532e230bd04f7a07df.png",
      true,
      "Pepperoni Pizza",
    ),
  ];

  static const double toolbarHeight = 56.0;

  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double getScreenHeight(BuildContext context) {
    return getScreenSize(context).height;
  }

  static double getScreenWidth(BuildContext context) {
    return getScreenSize(context).width;
  }

  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }
}
