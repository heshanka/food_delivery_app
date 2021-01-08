import 'package:food_delivery_app/model/Product.dart';
import 'package:food_delivery_app/view/widgets/ProductCard.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils.dart';

class FavoritesModel extends Model {
  //Holds the favorited product cards (displayed widget) in a list
  List<ProductCard> cardList = [];

  //Contains the list of Products that are favorited
  List<Product> favProductList = [];

  bool favProductListLoaded = false;
  bool favCardsLoaded = false;

  Future getFavProductCardList() async {
    if (!favCardsLoaded) {
      //Get the list of favorited Products stored locally first
      await getFavoritedProducts();
      if (favProductListLoaded && favProductList.isNotEmpty) {
        cardList = [];
        for (Product p in favProductList) {
          //Add the products as ProductCard widgets to cardList
          cardList.add(ProductCard(p));
        }
        favCardsLoaded = true;
        notifyListeners();
      }
    }
  }

  //Adds the favorited Products to cardList as product cards
  void getLocalFavProductCardList() {
    cardList = [];
    if (favProductList.isNotEmpty) {
      for (Product p in favProductList) {
        cardList.add(ProductCard(p));
      }
      notifyListeners();
    }
  }

  //Make a list of string IDs from the product IDs added to favProductList
  List<String> getStringIDList() {
    List<String> favIdList = [];
    for (Product p in favProductList) {
      if (!favIdList.contains(p.id)) {
        //to avoid duplicate entries
        favIdList.add(p.id.toString());
      }
    }
    return favIdList;
  }

  /*This method helps retrieve the favorited products in a list, from the local
    storage with shared preferences*/
  Future getFavoritedProducts() async {
    if (!favProductListLoaded) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //retreive the list with key 'favList'
      List<String> stringIds = prefs.getStringList('favList');
      if (stringIds != null) {
        for (String pId in stringIds) {
          for (Product product in Utils.productList) {
            if (int.parse(pId) == product.id && !favProductList.contains(product)) {
              favProductList.add(product);
            }
          }
        }
      }
      favProductListLoaded = true;
      notifyListeners();
    }
  }

  /*Called when user clicks on the grey heart icon, saves a list of String Ids from
  product ids into local storage with shared preferences. **Usually added to a 
  database, but for the scope of this project, the local storage is used*/

  Future addToFavorites(int productId, SharedPreferences prefs) async {
    //Find the product from the product list with the productId and add it to favProductList
    for (Product p in Utils.productList) {
      if (p.id == productId && !favProductList.contains(p)) {
        favProductList.add(p);
        break;
      }
    }
    //Save the product ids as a list of strings e.g. ['1','7','5']
    await prefs.setStringList("favList", getStringIDList());
    getLocalFavProductCardList();
    notifyListeners();
  }

  /*Called when the user clicks on the red heart icon; To remove a product from
  the list of favorites, which is stored as a String list of product IDs, it is
  required to reset the list with the updated version*/
  Future removeFromFavorites(int productId, SharedPreferences prefs) async {
    //first remove it from favProductList
    for (Product p in Utils.productList) {
      if (p.id == productId) {
        favProductList.remove(p);
        break;
      }
    }
    //save the updated list with the same shared pref string key
    await prefs.setStringList("favList", getStringIDList());
    getLocalFavProductCardList();
    notifyListeners();
  }
}
