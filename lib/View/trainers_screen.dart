import 'package:etqan/View/CustomWidgets/trainers.dart';
import 'package:etqan/View/subscription_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrainersScreen extends StatefulWidget {
  const TrainersScreen({super.key});

  @override
  State<TrainersScreen> createState() => _TrainersScreenState();
}

class _TrainersScreenState extends State<TrainersScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => SubscriptionScreen()),

      );
    }
    );
  }
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'المدربين',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'اختر من بين أفضل المدربين',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ],
                  ),
                  ImageIcon(
                    const AssetImage('assets/Images/Search.png'),
                    color: Colors.black,
                    size: 20.w,
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  trainer('مريم على', 'تخصص تنمية بشرية',
                      'assets/Images/faces-avtar01.png'),
                  trainer('إيناس حسن', 'تخصص طبخ',
                      'assets/Images/faces-avtar02.png'),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  trainer('حسن على', 'فنون جميلة',
                      'assets/Images/faces-avtar03.png'),
                  trainer('محمود مصطفى', 'برمجة تطبيقات',
                      'assets/Images/faces-avtar04.png'),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  trainer(
                      'عمرو سامى', 'تصميم', 'assets/Images/faces-avtar05.png'),
                  trainer(
                      'رامى سعد', 'بيزنس', 'assets/Images/faces-avtar06.png'),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
