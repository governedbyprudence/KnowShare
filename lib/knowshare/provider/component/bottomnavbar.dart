
import 'package:flutter/cupertino.dart';

class bottomNavProvider with ChangeNotifier{
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changeIndex(int index){
    _selectedIndex = index;
    notifyListeners();
  }
}