import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

typedef onTap = Function();

class AppCard extends StatelessWidget {
  String title;
  Color backgroundColor;
  onTap? ontap;
  AppCard({Key? key,required this.backgroundColor,required this.title,this.ontap}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(ontap!=null){
          ontap!();
        }
      },
      child: Container(
        height: 40.h,
        width: 40.h,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Stack(
          children: [
            Positioned.fill(top: 20,left: 20,child: Container(child: Text(title,style: TextStyle(fontSize: 20.sp),),)),
            Positioned.fill(top: 60,left: 60,child: Icon(Icons.photo))
          ],
        ),
      ),
    );
  }


}