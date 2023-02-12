import 'package:flutter/material.dart';
import 'package:knowshare_app/knowshare/components/cards.dart';
import 'package:knowshare_app/knowshare/components/error.dart';
import 'package:knowshare_app/knowshare/components/nav.dart';
import 'package:knowshare_app/knowshare/core/fetch/firestore.dart';
import 'package:knowshare_app/knowshare/core/models/category.dart';
class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late Future _getCategories;
  @override
  void initState() {
    super.initState();
    _getCategories = FirestoreDatabase.getCategories();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponents.appBar1(context),
    body: FutureBuilder(
      future: _getCategories,
      builder: (context,AsyncSnapshot snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Container(alignment: Alignment.center,child:const CircularProgressIndicator(),);
        }
        if(snapshot.hasData){
          List<Category> data = snapshot.data ;
          return GridView.builder(
              itemCount: data.length,
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
              ),
              itemBuilder:(context,index){
                return AppCard(
                  backgroundColor: Colors.green,
                  title: data[index].title,
                );
              });
        }
        else{
          return const ErrorIndicator();
        }
      }),
    );
  }
}
