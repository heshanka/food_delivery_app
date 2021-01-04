import 'package:food_delivery_app/controller/CartModel.dart';
import 'package:scoped_model/scoped_model.dart';

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

  static CartModel getCartModel() {
    return cart_model = cart_model ?? CartModel();
  }
}
