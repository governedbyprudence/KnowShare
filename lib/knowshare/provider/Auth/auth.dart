import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:knowshare_app/knowshare/core/auth/auth_repo.dart';

enum authState {
  loggedOut,
  waiting,
  loggedIn,
  error,
}

class authProvider with ChangeNotifier {
  authState _state=authState.waiting;
  authState get state => _state;
  authProvider(){
    setauthState();
  }
  Future<void> setauthState()async{
    bool _loggedin =await authRepo.isLoggedIn();
    if(_loggedin){
      _state=authState.loggedIn ;
    }
    else{
      _state=authState.loggedOut ;
    }
    notifyListeners();
  }
  void login()async{
    _state=authState.waiting;
    notifyListeners();
    if(kDebugMode) {
      _state=authState.loggedIn;
      notifyListeners();
    }
    else {
      var user = await authRepo.googleLogin();
      if(user!=null){
        _state = authState.loggedIn ;
      }
      else {
        _state =authState.error ;
      }
      notifyListeners();
    }
  }
}

