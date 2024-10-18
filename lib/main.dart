import 'package:device_preview/device_preview.dart';
import 'package:etqan/View/splash_screen.dart';
import 'package:etqan/firebase_options.dart';
import 'package:etqan/payment/stripe_keys.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';


void main() async{
  Stripe.publishableKey= ApiKeys.pusblishableKey;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: false,
      builder: (context) => ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_ , child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: const Locale('ar', ''),
            supportedLocales: const[
               Locale('ar', ''),
            ],
            localizationsDelegates: const[
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: ThemeData(
              fontFamily:'FFShamelFamily',
              useMaterial3: true,
            ),
            home: const Directionality(
            textDirection: TextDirection.rtl, child:
             SplashScreen()),
          );
        }
      ),
    );
  }
}
