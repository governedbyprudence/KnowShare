import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:knowshare_app/knowshare/core/models/category.dart';

class FirestoreDatabase {
  static Future<List<Category>> getCategories()async{
    QuerySnapshot snap=await FirebaseFirestore.instance.collection("notes").get();
    try {
      return snap.docs.map((e) => Category(title: e.id)).toList();
    }
    catch(e){
      print(e);
      return Future.error(e);
    }
  }
}