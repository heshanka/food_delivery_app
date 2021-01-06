import 'package:food_delivery_app/model/Product.dart';
import 'package:food_delivery_app/view/ProductCard.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils.dart';

class FavoritesModel extends Model {
  List<ProductCard> cardList = [];
  List<Product> favProductList = [];
  List<int> favIntIdList = [];
  bool favProductListLoaded = false;
  bool favCardsLoaded = false;

  Future getFavProductCardList() async {
    if (!favCardsLoaded) {
      await getFavListFromStringIds();
      if (favProductListLoaded && favProductList.isNotEmpty) {
        cardList = [];
        for (Product p in favProductList) {
          cardList.add(ProductCard(p));
        }
        favCardsLoaded = true;
        notifyListeners();
      }
    }
  }

  void getLocalFavProductCardList() {
    cardList = [];
    if (favProductList.isNotEmpty) {
      for (Product p in favProductList) {
        cardList.add(ProductCard(p));
      }
      notifyListeners();
    }
  }

  List<String> getStringIDList() {
    List<String> favIdList = [];
    for (Product p in favProductList) {
      if (!favIdList.contains(p.id)) {
        favIdList.add(p.id.toString());
      }
    }
    return favIdList;
  }

  Future getFavListFromStringIds() async {
    if (!favProductListLoaded) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> stringIds = prefs.getStringList('favList');
      for (String pId in stringIds) {
        for (Product product in Utils.productList) {
          if (int.parse(pId) == product.id) {
            favProductList.add(product);
          }
        }
      }
      favProductListLoaded = true;
      notifyListeners();
    }
  }

  Future addToFavorites(int productId, SharedPreferences prefs) async {
    for (Product p in Utils.productList) {
      if (p.id == productId && !favProductList.contains(p)) {
        favProductList.add(p);
        break;
      }
    }
    await prefs.setStringList("favList", getStringIDList());
    getLocalFavProductCardList();
    notifyListeners();
  }

  Future removeFromFavorites(int productId, SharedPreferences prefs) async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    for (Product p in Utils.productList) {
      if (p.id == productId) {
        favProductList.remove(p);
        break;
      }
    }
    await prefs.setStringList("favList", getStringIDList());
    getLocalFavProductCardList();
    notifyListeners();
  }
}
