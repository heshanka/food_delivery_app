import 'model/Product.dart';
import 'package:intl/intl.dart';

class Utils {
  static var numFormat = new NumberFormat("###.00", "en_US");

  static List<Product> productList = [
    Product(
      1,
      "Lentil Soup",
      "",
      12.5,
      1,
      "https://menu.indolj.com/upload/1584438166-1553264528-12-Lentil-Soup-\$4.99.jpeg-2.png",
      true,
    ),
    Product(
      2,
      "Chicken Burger",
      "Tomato, Worcestershire, and hot sauce gives this burger a tasty kick, topped with some sweet pickle relish, lettuce and cabbage slaw to balance out the spice.",
      6.50,
      3,
      "http://ghk.h-cdn.co/assets/17/33/1502998809-burger-king-grilled-chicken-sandwich.jpg",
      true,
    ),
    Product(
      3,
      "Beef Burger",
      "",
      9.20,
      3,
      "http://www.wendys.co.id/assets/media/group_product/beef_deluxe.png",
      true,
    ),
    Product(
      4,
      "Cheese Lovers",
      "",
      5.555,
      2,
      "https://www.cottageinn.com/app/uploads/2014/07/GarlicCheeseBread_sm1.png",
      true,
    ),
    Product(
      5,
      "Fried Rice",
      "",
      8.70,
      4,
      "https://eatchinwa.com/wp-content/uploads/2019/04/Chinwa-Chinwa%E2%80%99s-Fried-Rice-Chicken.png",
      true,
    ),
    Product(
      6,
      "Dumplings",
      "",
      10.50,
      4,
      "http://www.bibigo.com/img/en/obj_home1_1.png",
      true,
    ),
    Product(
      7,
      "Pepperoni Pizza",
      "",
      7.90,
      2,
      "https://forums.ultra-combo.com/uploads/default/original/2X/8/89674b29f7366334aae4ad532e230bd04f7a07df.png",
      true,
    ),
  ];
}
