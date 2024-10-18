import 'package:etqan/payment/payment_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'CustomWidgets/customClipPath.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        width: screenWidth,
        height: 10.sh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: screenWidth,
                  height: 430.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/Images/cover.jpg'),fit: BoxFit.cover),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      ImageIcon(const AssetImage('assets/Images/logo.png'),color: Colors.white,size: 100.w,),
                      Text('إتقان',style: TextStyle(color: Colors.white,fontSize: 20.sp),),
                      SizedBox(height: 20.h,),
                      Text('ابدأ التعلم اليوم',style: TextStyle(color: Colors.white,fontSize: 15.sp),),
                      SizedBox(height: 10.h,),
                      Text('الإلغاء فى أى وقت , سارى المفعول\nفى نهاية فترة الدفع.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey,fontSize: 10.sp),),
                      SizedBox(height: 12.h,),
                    TextButton(
                            style: TextButton.styleFrom(
                              minimumSize:Size(155.w, 40.h) ,
                                shape:RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              backgroundColor:const Color(0xffC246BE),
                            ),
                            onPressed: (){
                              PaymentManager.makePayment(80.99, 'EGP');
                            }, child:Text('بالسنة / 80.99\$',style: TextStyle(fontSize: 13.sp,color: Colors.white),)),
                      SizedBox(height: 10.h,),
                      TextButton(
                          style: TextButton.styleFrom(
                            minimumSize:Size(155.w, 40.h) ,
                            shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            backgroundColor:Colors.white,
                          ),
                          onPressed: (){
                            PaymentManager.makePayment(50.99, 'EGP');
                          }, child:Text('بالشهر / 50.99\$',style: TextStyle(fontSize: 13.sp,color: Colors.black),)),
                      SizedBox(height: 12.h,),
                      Text('12 شهراً بسعر 60 دولار أمريكية فى\nالشهر. وفر أكثر من 5%',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey,fontSize: 10.sp),),
                    ],
                  ),
                ),
              ],
            ),
          ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('أكثر من 100+ كورس ضمن كورساتنا المميزة',style: TextStyle(fontSize: 14.sp),),
                  SizedBox(height: 10.h,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        customCourse('التصوير الفوتوغرافى: التقط وشارك حياتك','assets/Images/photo2.jpg'),
                        SizedBox(width: 12.w,),
                        customCourse('المنسوجات اليدويةوالألوان النصفية','assets/Images/colors.jpg'),
                        SizedBox(width: 12.w,),
                        customCourse('تعلم اساسيات البرمجة من الصفر','assets/Images/program.jpg'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

        ],),
      ),
    );
  }
  Widget customCourse(String name,String image){
    return SizedBox(
      width: 150.w,
      child: Column(
        children: [
          Container(
            width: 150.w,
            height: 130.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover)
            ),
          ),
          SizedBox(height: 5.h,),
          Text( name ,overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 12.sp),)
        ],
      ),
    );
  }
}
