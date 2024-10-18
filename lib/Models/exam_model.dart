class ExamModel {
  final String question;
  final List<String> options;
  final int correctAnswer;

  ExamModel({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
      question: json['question'] ?? 'Unknown Course',
      options: List<String>.from(json['options'] ?? []),
      correctAnswer: json['correctAnswer'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
        'question': question,
        'options': options,
          'correctAnswer': correctAnswer,
    };
  }

}
