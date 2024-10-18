part of 'courses_cubit.dart';

abstract class CoursesState {}

final class CoursesInitial extends CoursesState {}

final class CoursesLoading extends CoursesState {}

final class CoursesSuccess extends CoursesState {
  final List<CourseModel> courses;

  CoursesSuccess(this.courses);
}

final class CoursesFailed extends CoursesState {
  final String message;

  CoursesFailed(this.message);
}
