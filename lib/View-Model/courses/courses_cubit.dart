import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etqan/Models/course_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit() : super(CoursesInitial());

  void getCourse(String category) async {
    try {
      emit(CoursesLoading());

      List<CourseModel> categoryCourses = [];

      final course = await FirebaseFirestore.instance
          .collection('courses')
          .doc(category)
          .collection('all-$category')
          .get();

      for (var doc in course.docs) {
        final courseSingle = CourseModel.fromJson(doc.data());
        categoryCourses.add(courseSingle);
      }
      emit(CoursesSuccess(categoryCourses));
    } catch (e) {
      emit(CoursesFailed('Failed to load $category courses'));
    }
  }

  void allCourses(String query) async {
    try {
      emit(CoursesLoading());

      List<CourseModel> allcourses = [];
      List<String> categories = [
        'arts',
        'design',
        'business',
        'programming',
        'animation',
        'cook',
        'music',
        'health'
      ];

      // Fetch courses for all categories
      for (var i = 0; i < categories.length; i++) {
        final course = await FirebaseFirestore.instance
            .collection('courses')
            .doc(categories[i])
            .collection('all-${categories[i]}')
            .get();

        for (final doc in course.docs) {
          final courseSingle = CourseModel.fromJson(doc.data());
          allcourses.add(courseSingle);
        }
      }
      allcourses = allcourses
          .where((course) =>
              course.name.toLowerCase().contains(query.toLowerCase()))
          .toList();

      emit(CoursesSuccess(allcourses));
    } catch (e) {
      emit(CoursesFailed(e.toString()));
    }
  }
}
