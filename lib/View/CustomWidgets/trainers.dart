import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget trainer(String name , String jobTitle , String image){
  return LayoutBuilder(
      builder: (context, constraints) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Container(
        width: screenWidth*0.435,
        height: 185.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover)
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(name,style: TextStyle(fontSize: 15.sp,color: Colors.white),),
            Text(jobTitle,style: TextStyle(fontSize: 10.sp,color: Colors.grey),),
          ],
        ),
      ),
    ],
  );
});}