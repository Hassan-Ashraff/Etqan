import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Stack containerCourse(String courseName, String image,String instructor) {
  return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Container(
        width: 10.sw,
        height: 200.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25.r)),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    courseName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8.5.sp,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'بواسطة $instructor',
                  style: TextStyle(color: Colors.grey, fontSize: 10.sp),
                ),
              ],
            ),
            CircleAvatar(
              radius: 14.r,
              backgroundColor: Colors.grey.shade200.withOpacity(.4),
              child: Center(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite, // Heart icon
                    color: Colors.white, // Icon color
                    size: 14.w, // Icon size
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
