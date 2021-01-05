import 'package:food_delivery_app/model/Product.dart';
import 'package:food_delivery_app/view/ProductCard.dart';
import 'package:scoped_model/scoped_model.dart';

import '../Utils.dart';

class FavoritesModel extends Model {
  List<Product> favList = [];

  List<ProductCard> getFavList() {
    List<ProductCard> cardList = [];
    for (Product p in favList) {
      cardList.add(ProductCard(p));
    }
    return cardList;
  }

  void addToFavorites(int productId) {
    for (Product p in Utils.productList) {
      if (p.id == productId && !favList.contains(p)) {
        favList.add(p);
      }
    }
    notifyListeners();
  }

  void removeFromFavorites(int productId) {
    for (Product p in Utils.productList) {
      if (p.id == productId) {
        favList.remove(p);
      }
    }
    notifyListeners();
  }
}
