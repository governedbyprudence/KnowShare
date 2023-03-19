import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:knowshare_app/knowshare/routes/explore.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../components/cards.dart';
import '../core/theme.dart';
import '../provider/component/bottomnavbar.dart';class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map> items=[
    {"title":"Saved","color":AppColors.lightViolet,"onTap":(context){}},
    {"title":"History","color":AppColors.mediumBlue,"onTap":(context){}},
    {"title":"Uploaded","color":AppColors.lightGreen,"onTap":(context){}},
    {"title":"Categories","color":AppColors.mediumBlue,"onTap": {}},

  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100.w,
            height: 30.h,
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
          ),
          Container(
            width: double.infinity,
            height: 100.h,
            margin:const EdgeInsets.only(top: 10,left: 20,right: 20),
            child: GridView.builder(
                itemCount: items.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10
                ), itemBuilder: (context,index)=>AppCard(backgroundColor: items[index]["color"],title: items[index]["title"],)),
          )
        ],
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
        margin:const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: Container(
          height: 20.h,
          width: 70.w,
          color: Colors.white,
        ),
      ),
    );
  }
}
