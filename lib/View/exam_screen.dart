import 'package:etqan/View-Model/exams/exams_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key, required this.subject, required this.level});
  final String subject;
  final String level;

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExamsCubit()..getExams(widget.subject, widget.level),
      child: BlocBuilder<ExamsCubit, ExamsState>(
        builder: (context, state) {
          if (state is ExamsLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: Color(0xffC246BE),
            ));
          }
          if (state is ExamsSuccess) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text(
                    'Question ${context.read<ExamsCubit>().currentQuestion + 1} of ${state.exams.length}'),
                backgroundColor: Colors.white,
                elevation: 0,
                titleTextStyle: const TextStyle(color: Colors.black),
                iconTheme: const IconThemeData(color: Colors.black),
              ),
              body: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 10.h,
                        width: MediaQuery.of(context).size.width *
                            (context.read<ExamsCubit>().currentQuestion + 1) /
                            state.exams.length,
                        decoration: BoxDecoration(
                          color: const Color(0xffC246BE),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Expanded(
                        child: PageView.builder(
                          controller: context.read<ExamsCubit>().pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.exams.length,
                          itemBuilder: (context, index) {
                            final exam = state.exams[index];
                            return SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    exam.question,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  ...List<Widget>.generate(
                                    exam.options.length,
                                    (optionIndex) => RadioListTile<int>(
                                      title: Text(
                                        exam.options[optionIndex],
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: context
                                                      .read<ExamsCubit>()
                                                      .isAnswered &&
                                                  optionIndex ==
                                                      exam.correctAnswer
                                              ? Colors
                                                  .green // Correct answer in green
                                              : Colors.black,
                                        ),
                                      ),
                                      value: optionIndex,
                                      groupValue: context
                                          .read<ExamsCubit>()
                                          .selectedOption,
                                      onChanged:
                                          context.read<ExamsCubit>().isAnswered
                                              ? null
                                              : (value) {
                                                  context
                                                      .read<ExamsCubit>()
                                                      .selectOption(value!);
                                                },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed:
                                context.read<ExamsCubit>().currentQuestion > 0
                                    ? context
                                        .read<ExamsCubit>()
                                        .previousQuestion
                                    : null,
                            style: ElevatedButton.styleFrom(
                              foregroundColor: const Color(0xffC246BE),
                              backgroundColor: Colors.white,
                              side: const BorderSide(
                                color: Color(0xffC246BE),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                            child: const Text(
                              'Back',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                          ElevatedButton(
                            onPressed:
                                context.read<ExamsCubit>().currentQuestion <
                                        state.exams.length - 1
                                    ? context.read<ExamsCubit>().nextQuestion
                                    : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffC246BE),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Text('Error');
          }
        },
      ),
    );
  }
}
