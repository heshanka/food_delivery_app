import 'package:scoped_model/scoped_model.dart';

class CartModel extends Model {
  //productID, quantity
  Map<int, int> productMap = {};

  void addToCart(int prodID, {int quantity = 1}) {
    if (productMap.keys.contains(prodID)) {
      productMap[prodID] += quantity;
    } else {
      productMap[prodID] = quantity;
    }
    notifyListeners();
  }
}
