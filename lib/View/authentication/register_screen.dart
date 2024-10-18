import 'package:etqan/View-Model/auth/auth_cubit.dart';
import 'package:etqan/View/authentication/login_screen.dart';
import 'package:etqan/View/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isChecked = false;
  bool isSecret = true;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Form(
        key: formKey,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthFailed) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'خطأ',
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    content: Text(state.message),
                    actions: [
                      TextButton(
                        child: Text(
                          'فهمت',
                          style: TextStyle(
                              color: const Color(0xffC246BE), fontSize: 12.sp),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              }
              if (state is AuthSuccess) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (route) => false);
              }
            },
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color:  Color(0xffC246BE),
                    ),
                  );
                }
                return SafeArea(
                    child: Container(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'تسجيل دخول',
                          style: TextStyle(fontSize: 20.sp),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if ((value!.isEmpty)) {
                              return "Enter your name";
                            }
                            return null;
                          },
                          cursorColor: const Color(0xffC246BE),
                          decoration: InputDecoration(
                              fillColor: const Color(0xffF9FAFA),
                              filled: true,
                              contentPadding: const EdgeInsets.all(16),
                              hintText: 'الاسم كامل',
                              hintStyle: TextStyle(
                                  fontSize: 15.sp, color: const Color(0xffA4ACAD)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide:
                                    BorderSide(width: .2.w, color: Colors.grey),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide: BorderSide(
                                    width: .2.w, color: const Color(0xffC246BE)),
                              )),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextFormField(
                          controller: emailcontroller,
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: const Color(0xffC246BE),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (!(value!.contains('@') &&
                                value.contains('.') &&
                                value.length > 8)) {
                              return "Email not valid";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              fillColor: const Color(0xffF9FAFA),
                              // Background color inside the TextFormField
                              filled: true,
                              contentPadding: const EdgeInsets.all(16),
                              hintText: 'البريد الإكتروني',
                              hintStyle: TextStyle(
                                  fontSize: 15.sp, color: const Color(0xffA4ACAD)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide:
                                    BorderSide(width: .2.w, color: Colors.grey),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide: BorderSide(
                                    width: .2.w, color: const Color(0xffC246BE)),
                              )),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextFormField(
                          controller: passwordcontroller,
                          keyboardType: TextInputType.visiblePassword,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: isSecret ? true : false,
                          cursorColor: const Color(0xffC246BE),
                          validator: (value) {
                            if ((value!.length < 8)) {
                              return "Password is very weak";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              fillColor: const Color(0xffF9FAFA),
                              filled: true,
                              contentPadding: const EdgeInsets.all(16),
                              hintText: 'كلمة المرور',
                              hintStyle: TextStyle(
                                  fontSize: 15.sp, color: const Color(0xffA4ACAD)),
                              suffixIcon: isSecret
                                  ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isSecret = false;
                                        });
                                      },
                                      icon: const Icon(Icons.visibility_off,
                                          color: Colors.grey),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isSecret = true;
                                        });
                                      },
                                      icon: const Icon(Icons.remove_red_eye,
                                          color: Colors.grey),
                                    ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide:
                                    BorderSide(width: .2.w, color: Colors.grey),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide: BorderSide(
                                    width: .2.w, color: const Color(0xffC246BE)),
                              )),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              side: const BorderSide(color: Colors.grey),
                              checkColor: Colors.white,
                              activeColor: const Color(0xffC246BE),
                              value: isChecked,
                              onChanged: (newValue) {
                                setState(() {
                                  isChecked = newValue!;
                                });
                              },
                            ),
                            Expanded(
                              child: Text(
                                'من خلال إنشاء حساب ، فإنك توافق على الشروط والأحكام الخاصة بنا',
                                style: TextStyle(fontSize: 13.sp),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        SizedBox(
                          width: 10.sw,
                          height: 60.h,
                          child: TextButton(
                            onPressed: () {
                              if (formKey.currentState!.validate() &&
                                  isChecked == true) {
                                context.read<AuthCubit>().register(
                                    emailcontroller.text,
                                    passwordcontroller.text);
                              }
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xffC246BE),
                              padding: const EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                            ),
                            child: Text(
                              'إنشاء حساب جديد',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.sp),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(' تمتلك حساب بالفعل؟',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12.r)),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const LoginScreen()),
                                  (Route<dynamic> route) => false,
                                );
                              },
                              child: Text(
                                ' تسجيل الدخول',
                                style: TextStyle(
                                    color: const Color(0xffC246BE), fontSize: 12.r),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ));
              },
            ),
          ),
        ),
      ),
    );
  }
}
