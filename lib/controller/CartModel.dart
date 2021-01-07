import '../Utils.dart';
import '../model/Product.dart';
import 'package:scoped_model/scoped_model.dart';

class CartModel extends Model {
  //Product, quantity
  Map<Product, int> productMap = {};

  void addToCart(int prodID, {int quantity = 1}) {
    // if (productMap.keys.contains(prodID)) {
    if (productMap.keys.contains(getProductFromId(prodID))) {
      productMap[getProductFromId(prodID)] += quantity;
    } else {
      productMap[getProductFromId(prodID)] = quantity;
    }
    notifyListeners();
  }

  void removeFromCart(int prodID, {int quantity = 1}) {
    if (productMap.keys.contains(getProductFromId(prodID))) {
      if (productMap[getProductFromId(prodID)] > 1) {
        productMap[getProductFromId(prodID)] -= 1;
      } else {
        productMap.remove(getProductFromId(prodID));
      }
    }
    notifyListeners();
  }

  int getProductQuantity(int prodID) {
    if (productMap.keys.contains(getProductFromId(prodID))) {
      return productMap[getProductFromId(prodID)];
    } else {
      return 1;
    }
  }

  Product getProductFromId(int id) {
    for (Product p in Utils.productList) {
      if (p.id == id) {
        return p;
      }
    }
  }

  double getTotalCartPrice() {
    double totalPrice = 0;
    for (Product key in productMap.keys) {
      totalPrice += productMap[key] * key.price;
    }
    return totalPrice;
  }

  int getTotalCartQuantity() {
    int totalQuantity = 0;
    for (Product key in productMap.keys) {
      totalQuantity += productMap[key];
    }
    return totalQuantity;
  }
}
