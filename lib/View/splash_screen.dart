import 'dart:async';
import 'package:etqan/View/authentication/login_screen.dart';
import 'package:etqan/View/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double ballY = 0;
  double widthVal = 50;
  double heightVal = 50;
  double bottomVal = 500;
  bool add = false;
  bool showShadow = false;
  int times = 0;
  bool showComic = false;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1))
      ..addListener(() {
        if (add) {
          ballY += 15;
        } else {
          ballY -= 15;
        }

        if (ballY <= -200) {
          times += 1;
          add = true;
          showShadow = true;
        }

        if (ballY >= 0) {
          add = false;
          showShadow = false;
          widthVal += 50;
          heightVal += 50;
          bottomVal -= 200;
        }

        if (times == 3) {
          showShadow = false;
          widthVal = width(context);
          heightVal = height(context);

          Timer(const Duration(milliseconds: 300), () {
            setState(() {
              showComic = true;
            });
            Timer(const Duration(seconds: 2), () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) =>
                FirebaseAuth.instance.currentUser == null ?
                const LoginScreen() :const HomeScreen(),),
              );
            });
          });
          _controller.stop();
        }

        setState(() {});
      });

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          width: width(context),
          height: height(context),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedPositioned(
                bottom: bottomVal,
                duration: const Duration(milliseconds: 600),
                child: Column(
                  children: [
                    // Bouncing ball
                    Transform.translate(
                      offset: Offset(0, ballY),
                      child: AnimatedScale(
                        duration: const Duration(milliseconds: 200),
                        scale: times == 3 ? 5 : 1,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 1000),
                          width: widthVal,
                          height: heightVal,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffC246BE),

                          ),
                        ),
                      ),
                    ),
                    // Shadow under the ball
                    if (showShadow)
                      Container(
                        width: 50,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.2),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                  ],
                ),
              ),
              // Show comic or message when animation ends
              if (showComic)
                 Center(
                   child: Container(
                     width: 500,
                     decoration: const BoxDecoration(
                       image: DecorationImage(image: AssetImage('assets/Images/0.png'))
                     ),
                   ),
                 ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to calculate screen width
  double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Helper function to calculate screen height
  double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
