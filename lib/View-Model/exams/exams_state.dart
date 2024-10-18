part of 'exams_cubit.dart';

abstract class ExamsState {}

final class ExamsInitial extends ExamsState {}

final class ExamsLoading extends ExamsState {}

final class ExamsSuccess extends ExamsState {
  final List<ExamModel> exams;

  ExamsSuccess({required this.exams});
}

final class ExamsFailed extends ExamsState {}
