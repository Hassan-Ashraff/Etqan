import 'package:etqan/View-Model/courses/courses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    return BlocProvider(
      create: (context) => CoursesCubit()..allCourses(_searchController.text),
      child: BlocBuilder<CoursesCubit, CoursesState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        BlocProvider.of<CoursesCubit>(context).allCourses(value);
                      },
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'البحث عن الكورسات',
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                          color: Colors.grey,
                        ),
                        prefixIcon: ImageIcon(
                          AssetImage('assets/Images/Search.png'),
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color(0xffC246BE)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                          BorderSide(color: Color(0xffC246BE)), // Change to desired color
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          if (state is CoursesLoading) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Color(0xffC246BE),
                              ),
                            );
                          } else if (state is CoursesSuccess) {
                            return ListView.builder(
                              itemCount: state.courses.length,
                              itemBuilder: (context, index) {
                                final course = state.courses[index];
                                return Column(
                                  children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: Text(course.name),
                                      trailing: Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(course.image),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                    SizedBox(height: 5),
                                    Divider(
                                      thickness: 0.2,
                                      color: Colors.grey,
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            return Center(child: Text('لا توجد نتائج'));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
