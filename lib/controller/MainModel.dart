import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model{
  int _selectedIndex = 0;

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  int getSelectedIndex(){
    return _selectedIndex;
  }
}
