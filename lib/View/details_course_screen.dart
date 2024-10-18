import 'package:etqan/Models/course_model.dart';
import 'package:etqan/View/course_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsCourseScreen extends StatelessWidget {
  const DetailsCourseScreen({super.key, required this.courseItem});
  final CourseModel courseItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('تفاصيل الكورس',style: TextStyle(fontSize: 20.sp),),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 10.sw,
                height: 300.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(courseItem.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(courseItem.name, style: TextStyle(fontSize: 17.sp)),
              SizedBox(height: 5.h),
              Row(
                children: [
                  Row(
                    children: [
                      ImageIcon(
                        const AssetImage('assets/Images/Level.png'),
                        color: const Color(0xffC246BE),
                        size: 15.w,
                      ),
                      SizedBox(width: 6.w),
                      Column(
                        children: [
                          SizedBox(height: 5.h),
                          Text('بدائي',style: TextStyle(fontSize:14.sp)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 20.w),
                  Row(
                    children: [
                      ImageIcon(
                        const AssetImage('assets/Images/Student.png'),
                        color: const Color(0xffC246BE),
                        size: 15.w,
                      ),
                      SizedBox(width: 6.w),
                      Column(
                        children: [
                          SizedBox(height: 5.h),
                          Text('7 آلاف طالب',style: TextStyle(fontSize:14.sp)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 20.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        const AssetImage('assets/Images/Star.png'),
                        color: const Color(0xffC246BE),
                        size: 15.w,
                      ),
                      SizedBox(width: 6.w),
                      Column(
                        children: [
                          SizedBox(height: 5.h),
                          Text('4.8',style: TextStyle(fontSize:14.sp)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                'القسم : ${courseItem.department}',
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),
              Text(
                'مقدم الدورة : ${courseItem.instructor}',
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),
              Text(
                'عدد الدروس : ${courseItem.videos.length}',
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),
              Text(
                'يوجد شهادة مجانية بعد إنتهاءك من الدورة',
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),
              SizedBox(height: 10.h),
              Text('الدروس', style: TextStyle(fontSize: 17.sp)),
              SizedBox(height: 10.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: courseItem.videos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(courseItem.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 25.w,
                          child: const CircleAvatar(
                            backgroundColor: Color(0xffFFFAFF),
                            child: Icon(
                              Icons.play_arrow,
                              color: Color(0xffC246BE),
                            ),
                          ),
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.play_circle_filled, color: Color(0xffC246BE)),
                    title: Text(courseItem.nameofvideos[index], style: TextStyle(fontSize: 15.sp)),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CourseScreen(videoUrl: courseItem.videos[index],videoName: courseItem.nameofvideos[index],),
                      ));
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
