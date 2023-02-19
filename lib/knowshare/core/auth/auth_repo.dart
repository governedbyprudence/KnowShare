import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class authRepo{
  static Future googleLogin()async{
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  static Future<bool> isLoggedIn()async{
    if(FirebaseAuth.instance.currentUser!=null){
      return true;
    }
    else{
      return false;
    }
  }
  static Future googleLogout()async{
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();

  }
}
