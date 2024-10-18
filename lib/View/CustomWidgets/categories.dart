import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 Container category(String nameOfCategory, String icon){
    return Container(
      width: 115.w,
      height: 45.h,
      decoration: BoxDecoration(
        border: Border.all(
          color:
          Colors.grey,
          width: .4.w,
        ),
        borderRadius: BorderRadius.all(Radius.circular(
            15.r)),
      ),
      child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 16.w,
                child: ImageIcon(
                  color: const Color(0xffC246BE),
                  AssetImage(
                    'assets/Images/$icon.png',
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(nameOfCategory,style: TextStyle(fontSize: 11.sp),),
            ],
          )),
    );
  }
