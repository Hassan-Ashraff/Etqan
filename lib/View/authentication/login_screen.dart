import 'package:etqan/View-Model/auth/auth_cubit.dart';
import 'package:etqan/View/authentication/register_screen.dart';
import 'package:etqan/View/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    create: (context) => AuthCubit(),
    child: Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
       if(state is AuthFailed){
       showDialog(
       context: context,
       barrierDismissible: false,
       builder: (context) => AlertDialog(
         title: Text('خطأ',style: TextStyle(fontSize: 20.sp),),
         content: Text(state.message),
         actions: [
           TextButton(
             child: Text('فهمت',style: TextStyle(color:const Color(0xffC246BE),fontSize: 12.sp),),
             onPressed: () {
               Navigator.of(context).pop();
             },
           ),
         ],
       ),
     );
       }
       if(state is AuthSuccess){
     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>  const HomeScreen()),(route) => false);

       }

      },
      child: BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
    if (state is AuthLoading) {
      return const Center(child: CircularProgressIndicator(
        color: Color(0xffC246BE),
      ));
    }
    return SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Text(
                  'تسجيل دخول',
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
              SizedBox(height: 25.h,),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                cursorColor: const Color(0xffC246BE),
                decoration: InputDecoration(
                    fillColor: const Color(
                        0xffF9FAFA),
                    filled: true,
                    contentPadding: const EdgeInsets.all(16),
                    hintText: 'البريد الإكتروني',
                    hintStyle: TextStyle(fontSize: 15.sp, color: const Color(0xffA4ACAD)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(width: .2.w, color: Colors.grey),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(width: .2.w, color: const Color(0xffC246BE)),
                    )),
              ),
              SizedBox(
                height: 15.h,
              ),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                cursorColor: const Color(0xffC246BE),
                decoration: InputDecoration(
                    fillColor: const Color(
                        0xffF9FAFA),
                    filled: true,
                    contentPadding: const EdgeInsets.all(16),
                    hintText: 'كلمة المرور',
                    hintStyle: TextStyle(fontSize: 15.sp, color: const Color(0xffA4ACAD)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(width: .2.w, color: Colors.grey),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(width: .2.w, color: const Color(0xffC246BE)),
                    )),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'نسيت كلمة المرور؟',
                style: TextStyle(color: const Color(0xffC246BE),fontSize: 12.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 10.sw,
                height: 60.h,
                child: TextButton(
                  onPressed: () async {
                    context.read<AuthCubit>().login(emailController.text, passwordController.text);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xffC246BE),
                    padding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                  child: Text(
                    'تسجيل الدخول',
                    style: TextStyle(color: Colors.white, fontSize: 15.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('لا تمتلك حساب؟',
                      style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const RegisterScreen()), (route)=>false);
                    },
                    child: Text(
                      ' قم بإنشاء حساب',
                      style: TextStyle(color: const Color(0xffC246BE), fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.2,
                      color: Colors.grey,
                      height: 1.h,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'أو',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.2,
                      color: Colors.grey,
                      height: 1.h,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              SizedBox(
                width: 10.sw,
                height: 60.h,
                child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      side: BorderSide(
                        color: Colors.grey,
                        width: .2.w,
                      ),
                    )),
                    child: Row(
                      children: [
                        const Image(
                          image: AssetImage(
                            'assets/Images/Google.png',
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'تسجيل بواسطة جوجل',
                          style: TextStyle(fontSize: 15.sp, color: Colors.black),
                        ),
                        const Spacer(),
                      ],
                    )),
              ),
              SizedBox(height: 12.h),
              SizedBox(
                width: 10.sw,
                height: 60.h,
                child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      side: BorderSide(
                        color: Colors.grey,
                        width: .2.w,
                      ),
                    )),
                    child: Row(
                      children: [
                        const Image(
                          image: AssetImage(
                            'assets/Images/Apple.png',
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'تسجيل بواسطة أبل',
                          style: TextStyle(fontSize: 15.sp, color: Colors.black),
                        ),
                        const Spacer(),
                      ],
                    )),
              ),
              SizedBox(height: 12.h),
              SizedBox(
                width: 10.sw,
                height: 60.h,
                child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      side: BorderSide(
                        color: Colors.grey,
                        width: .2.w,
                      ),
                    )),
                    child: Row(
                      children: [
                        const Image(
                          image: AssetImage(
                            'assets/Images/Facebook.png',
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'تسجيل بواسطة فيسبوك',
                          style: TextStyle(fontSize: 15.sp, color: Colors.black),
                        ),
                        const Spacer(),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ));
      },
    ),
    ),
    ),
);
  }
}
