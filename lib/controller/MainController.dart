import 'CartModel.dart';
import 'package:scoped_model/scoped_model.dart';

import 'FavoritesController.dart';

class MainController extends Model {
  int _selectedIndex = 0;

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  int getSelectedIndex() {
    return _selectedIndex;
  }

  static CartController cart_model;

  static FavoritesModel fav_model;

  static CartController getCartModel() {
    return cart_model = cart_model ?? CartController();
  }

  static FavoritesModel getFavoritesModel() {
    return fav_model = fav_model ?? FavoritesModel();
  }
}
