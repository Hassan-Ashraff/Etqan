
import 'package:etqan/View/CustomWidgets/categories.dart';
import 'package:etqan/View/all_courses_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:etqan/View/authentication/register_screen.dart';
import 'package:etqan/View/search_screen.dart';
import 'package:etqan/View/select_language_screen.dart';
import 'package:etqan/View/trainers_screen.dart';
import 'package:etqan/View/CustomWidgets/trainers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
              width: 10.sw,
              height: 10.sh,
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'مرحبا بك!..',
                              style: TextStyle(fontSize: 20.sp),
                            ),
                            Text(
                              'ماذا تود ان تتعلم؟',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(children: [
                          Stack(alignment: Alignment.center, children: [
                            SizedBox(
                              width: 40.w,
                              height: 40.h,
                              child: CircularProgressIndicator(
                                value: 0.25,
                                strokeWidth: 2.5,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Color(0xffC246BE)),
                                backgroundColor: Colors.grey.shade300,
                              ),
                            ),
                            CircleAvatar(
                              radius: 15.r,
                              backgroundImage: const AssetImage(
                                  'assets/Images/faces-avtar07.png'),
                            ),
                          ]),
                          SizedBox(
                            width: 5.w,
                          ),
                          IconButton(
                              onPressed: () async {
                                await FirebaseAuth.instance.signOut();
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => const RegisterScreen()),
                                    (route) => false);
                              },
                              icon: const Icon(
                                Icons.notifications,
                                color: Colors.black,
                              ))
                        ]),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SearchScreen()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          width: 10.sw,
                          height: 50.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: .2.w,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r)),
                          ),
                          child: Row(
                            children: [
                              const ImageIcon(
                                AssetImage('assets/Images/Search.png'),
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                'البحث عن الكورسات',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w100,
                                    fontSize: 14.sp),
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 15.h,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AllCoursesScreen(
                                                typeOfCourses: 'cook',
                                                nameOftypeCourses: 'طبخ')));
                              },
                              child: category('طبخ', 'Kitchen')),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AllCoursesScreen(
                                                typeOfCourses: 'arts',
                                                nameOftypeCourses: 'فنون')));
                              },
                              child: category('فنون', 'Arts')),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AllCoursesScreen(
                                                typeOfCourses: 'design',
                                                nameOftypeCourses: 'تصميم')));
                              },
                              child: category('تصميم', 'designtools')),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AllCoursesScreen(
                                                typeOfCourses: 'business',
                                                nameOftypeCourses: 'بيزنس')));
                              },
                              child: category('البيزنس', 'chart')),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AllCoursesScreen(
                                                typeOfCourses: 'animation',
                                                nameOftypeCourses: 'انيميشن')));
                              },
                              child: category('التحريك', 'Animation')),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AllCoursesScreen(
                                                typeOfCourses: 'music',
                                                nameOftypeCourses: 'موسيقى')));
                              },
                              child: category('الموسيقى', 'Music')),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AllCoursesScreen(
                                                typeOfCourses: 'health',
                                                nameOftypeCourses: 'صحه')));
                              },
                              child: category('الصحه', 'Wellness')),
                          SizedBox(
                            width: 10.w,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'فئه حديثة',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => DetailsCourseScreen(),
                        // ));
                      },
                      child: Container(
                        width: 10.sw,
                        height: 110.h,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xffF9FAFA),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment
                              .center, // Align items vertically in the center
                          children: [
                            Stack(alignment: Alignment.center, children: [
                              Container(
                                width: 85.w,
                                height: 85.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  image: const DecorationImage(
                                    image:
                                        AssetImage('assets/Images/photo.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: 45.w,
                                  child: const CircleAvatar(
                                      backgroundColor: Color(0xffFFFAFF),
                                      child: Icon(
                                        Icons.play_arrow,
                                        color: Color(0xffC246BE),
                                      ))),
                            ]),
                            SizedBox(width: 15.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'التصوير الفوتوغرافى: التقط\nوشارك حياتك',
                                  style: TextStyle(
                                      fontSize:
                                          12.sp), // Adjust font size as needed
                                ),
                                SizedBox(height: 5.h),
                                Row(
                                  children: [
                                    Text(
                                      'محمد نظمى  .',
                                      style: TextStyle(
                                          fontSize: 10.sp, color: Colors.grey),
                                    ),
                                    Text(
                                      ' 41 دقيقة ',
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          color:const Color(0xffC246BE)),
                                    ),
                                    Text(
                                      'متبقية',
                                      style: TextStyle(
                                          fontSize: 10.sp, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                SizedBox(
                                  width: 170.w,
                                  height: 3.h,
                                  child: LinearProgressIndicator(
                                    value: 0.75,
                                    valueColor: const AlwaysStoppedAnimation<Color>(
                                      Color(0xffC246BE),
                                    ),
                                    backgroundColor: Colors.grey.shade300,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text('فئات موصي بها لك', style: TextStyle(fontSize: 15.sp)),
                    SizedBox(height: 5.h),
                    Text('بناءاً على اهتمامتك',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.grey,
                        )),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*0.435,
                                  height: 150.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.r),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/Images/design.jpg'),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.bookmark,
                                      color: Color(0xffC246BE),
                                    ))
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'التصميم',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: const Color(0xffC246BE),
                              ),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*0.435,
                                  height: 150.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.r),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/Images/programming.jpg'),
                                          fit: BoxFit.cover)),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.bookmark,
                                      color: Color(0xffC246BE),
                                    ))
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'البرمجة',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: const Color(0xffC246BE),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                     InkWell(
                         onTap: (){
                           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const TrainersScreen()));
                         },
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text('افضل المدربين', style: TextStyle(fontSize: 15.sp)),
                             SizedBox(height: 5.h),
                             Text('بناءاً على اختيارك',
                                 style: TextStyle(
                                   fontSize: 10.sp,
                                   color: Colors.grey,
                                 )),
                           ],
                         )),

                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        trainer('مريم على','تخصص تنمية بشرية','assets/Images/faces-avtar01.png'),
                        trainer('إيناس حسن','تخصص طبخ','assets/Images/faces-avtar02.png'),


                      ],
                    ),
                    SizedBox(height: 15.h),
                    Text('امتحانات اختبار اللغه بشهاده معتمده',
                        style: TextStyle(fontSize: 15.sp)),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SelectLanguageScreen()));
                      },
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 200.h,
                          viewportFraction: 1,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 6),
                          autoPlayCurve: Curves.easeInOut,
                        ),
                        items: [
                          'assets/Images/1.png',
                          'assets/Images/2.png',
                          'assets/Images/3.png',
                          'assets/Images/4.png',
                          'assets/Images/5.png'
                        ].map((assetImage) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.symmetric(horizontal: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.r),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      assetImage,
                                    ), // Load image from assets
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
