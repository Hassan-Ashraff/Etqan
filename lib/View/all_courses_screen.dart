import 'package:etqan/View/CustomWidgets/container_course.dart';
import 'package:flutter/material.dart';
import 'package:etqan/View-Model/courses/courses_cubit.dart';
import 'package:etqan/View/details_course_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AllCoursesScreen extends StatelessWidget {
  const AllCoursesScreen({super.key, required this.typeOfCourses, required this.nameOftypeCourses});
final String typeOfCourses;
  final String nameOftypeCourses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("كورسات $nameOftypeCourses",style: TextStyle(fontSize: 20.sp),),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => CoursesCubit()..getCourse(typeOfCourses),
          child: BlocBuilder<CoursesCubit, CoursesState>(
            builder: (context, state) {
              if (state is CoursesLoading) {
                return const Center(child: CircularProgressIndicator(
                  color: Color(0xffC246BE),
                ));
              }
              if (state is CoursesSuccess) {
                return ListView.builder(
                    itemCount: state.courses.length,
                    itemBuilder: (context, index) {
                      final course = state.courses[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsCourseScreen(courseItem: course)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: containerCourse(
                              course.name, course.image,course.instructor),
                        ),
                      );
                    }
                );
              }
              if (state is CoursesFailed) {
                return const Text('حدث خطأ');
              }
              return Container();


            },
          ),
        ),
      ),
    );
  }
}
