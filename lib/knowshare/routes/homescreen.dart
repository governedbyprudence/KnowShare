import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:knowshare_app/knowshare/components/drawer.dart';
import 'package:knowshare_app/knowshare/core/theme.dart';
import 'package:knowshare_app/knowshare/provider/component/bottomnavbar.dart';
import 'package:knowshare_app/knowshare/provider/syscheck.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
      child: Consumer<bottomNavProvider>(
        builder:(context,state,child)=>Scaffold(
          bottomNavigationBar: CustomBottomNavigator(),
          body: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100.w,
                  height: 100.h,
                  child: Column(
                    children: [
                      Container(
                        height: 30.h,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          AppColors.lightGreen,
                                          AppColors.deepGreen,
                                          Colors.black
                                        ]
                                    )
                                ),
                              ),
                            ),
                            Positioned(
                              child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                CarouselItem(context),
                                CarouselItem(context),
                                CarouselItem(context),
                                CarouselItem(context),
                              ],
                                )
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget CarouselItem(BuildContext context){
    return GestureDetector(
      onTap: (){
        if (kDebugMode) {
          print(context.watch<bottomNavProvider>().selectedIndex);
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 70.w,
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: Container(
          height: 20.h,
          width: 70.w,
          color: Colors.white,
        ),
      ),
    );
  }
}
