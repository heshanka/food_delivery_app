import 'CartModel.dart';
import 'package:scoped_model/scoped_model.dart';

import 'FavoritesModel.dart';

class MainModel extends Model {
  int _selectedIndex = 0;

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  int getSelectedIndex() {
    return _selectedIndex;
  }

  static CartModel cart_model;

  static FavoritesModel fav_model;

  static CartModel getCartModel() {
    return cart_model = cart_model ?? CartModel();
  }

  static FavoritesModel getFavoritesModel() {
    return fav_model = fav_model ?? FavoritesModel();
  }
}
