import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:knowshare_app/knowshare/components/drawer.dart';
import 'package:knowshare_app/knowshare/core/theme.dart';
import 'package:knowshare_app/knowshare/provider/component/bottomnavbar.dart';
import 'package:knowshare_app/knowshare/provider/syscheck.dart';
import 'package:knowshare_app/knowshare/routes/explore.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../components/cards.dart';
import '../components/nav.dart';
import 'home.dart';

class homeScreenRoute extends StatefulWidget {
  const homeScreenRoute({Key? key}) : super(key: key);
  static const routeName ="/home";
  @override
  _homeScreenRouteState createState() => _homeScreenRouteState();
}

class _homeScreenRouteState extends State<homeScreenRoute> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: appBarComponents.appBar1(context),
        bottomNavigationBar:const CustomBottomNavigator(),
        body: Consumer<bottomNavProvider>(
          builder:(context,state,child){
            if(state.selectedIndex==0){
              return const Home();
            }
            else if(state.selectedIndex==1){
              return const Categories();
            }
            else{
              return Container();
            }
          }
        ),
      ),
    );
  }
}
