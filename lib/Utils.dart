import 'package:flutter/material.dart';

import 'model/Category.dart';
import 'model/Product.dart';
import 'package:intl/intl.dart';

class Utils {
  static var numFormat = new NumberFormat("###.00", "en_US");

  static double pWidth = 392.7;

  static List<Category> categoryList = [
    Category(1, "Soups",
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.villagecoffee.biz%2Fwp-content%2Fuploads%2F2017%2F01%2FSoup_Tomato.png&f=1&nofb=1"),
    Category(2, "Pizza",
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fredgrasshopper.com.au%2Fwp-content%2Fuploads%2F2019%2F05%2Fpizza.png&f=1&nofb=1"),
    Category(3, "Burgers",
        "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Ffreepngimages.com%2Fwp-content%2Fuploads%2F2016%2F11%2Fbacon-burger.png&f=1&nofb=1"),
    Category(4, "Chinese",
        "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.hertfordshirekarate.co.uk%2Fwp-content%2Fuploads%2F2017%2F01%2Fchinese-food.png&f=1&nofb=1"),
  ];
  static List<Product> productList = [
    Product(
      1,
      "Lentil Soup",
      "",
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
      "",
      9.20,
      3,
      "http://www.wendys.co.id/assets/media/group_product/beef_deluxe.png",
      true,
      "Beef Burger",
    ),
    Product(
      4,
      "Cheese Lovers",
      "",
      5.55,
      2,
      "https://www.cottageinn.com/app/uploads/2014/07/GarlicCheeseBread_sm1.png",
      true,
      "Cheese Lovers",
    ),
    Product(
      5,
      "Fried Rice",
      "",
      8.70,
      4,
      "https://eatchinwa.com/wp-content/uploads/2019/04/Chinwa-Chinwa%E2%80%99s-Fried-Rice-Chicken.png",
      true,
      "Fried Rice",
    ),
    Product(
      6,
      "Dumplings",
      "",
      10.50,
      4,
      "http://www.bibigo.com/img/en/obj_home1_1.png",
      true,
      "Dumplings",
    ),
    Product(
      7,
      "Pepperoni Pizza",
      "",
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
