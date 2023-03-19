import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../components/cards.dart';
import '../core/theme.dart';
import '../provider/component/bottomnavbar.dart';



class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                                  ])),
                            ),
                          ),
                          Positioned(
                              child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: const [
                              // CarouselItem(),
                              // CarouselItem(),
                              // CarouselItem(),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
