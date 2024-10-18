import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etqan/Models/exam_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'exams_state.dart';

class ExamsCubit extends Cubit<ExamsState> {
  ExamsCubit() : super(ExamsInitial());

  int _selectedOption = -1;
  int _currentQuestion = 0;
  bool _isAnswered = false;
  final PageController _pageController = PageController();
  List<ExamModel> exams = [];
  int get selectedOption => _selectedOption;
  int get currentQuestion => _currentQuestion;
  bool get isAnswered => _isAnswered;
  PageController get pageController => _pageController;

  void getExams(String subject, String level) async {
    try {
      emit(ExamsLoading());
      final exam = await FirebaseFirestore.instance
          .collection('exams')
          .doc(subject)
          .collection('$level-level')
          .get();
      for (var doc in exam.docs) {
        final examSingle = ExamModel.fromJson(doc.data());
        exams.add(examSingle);
      }

      emit(ExamsSuccess(exams: exams));
    } catch (e) {
      // TODO
    }
  }

  void nextQuestion() {
    if (_currentQuestion < exams.length - 1) {
      _currentQuestion++;
      _selectedOption = -1; // Reset the selected option
      _isAnswered = false; // Reset answer status
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    emit(ExamsSuccess(exams: exams));
    if (_currentQuestion == exams.length - 1) {}
  }

  void previousQuestion() {
    if (_currentQuestion >= 0) {
      _currentQuestion--;
      _selectedOption = -1; // Reset the selected option
      _isAnswered = false; // Reset answer status
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    emit(ExamsSuccess(exams: exams));
  }

  void selectOption(int selected) {
    _selectedOption = selected;
    _isAnswered = true;
    emit(ExamsSuccess(exams: exams));
  }
}
