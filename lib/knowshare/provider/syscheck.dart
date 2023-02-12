import 'package:flutter/cupertino.dart';

class sysCheckProvider with ChangeNotifier {
  bool _isOk = false;
  bool get isOk => _isOk;
  sysCheckProvider(){
    print("System check");
    Future.delayed(Duration(seconds: 2),(){
      _isOk = true;
      notifyListeners();
    });
  }
}