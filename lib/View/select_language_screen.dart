import 'package:etqan/View/CustomWidgets/level_of_language.dart';
import 'package:etqan/View/exam_screen.dart';
import 'package:flutter/material.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('استطلاع',style: TextStyle(fontSize: 15),),
        ),
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'English',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ExamScreen(subject: 'English',level: 'high')));
                            },
                            child: levelOfLanguage('Low',10,30)),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ExamScreen(subject: 'English',level: 'high')));
                            },
                            child: levelOfLanguage('Mid',10,30)),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ExamScreen(subject: 'English',level: 'high')));
                            },
                            child: levelOfLanguage('High',10,30)),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'German',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ExamScreen(subject: 'German',level: 'high')));
                            },
                            child: levelOfLanguage('Low',10,30)),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ExamScreen(subject: 'German',level: 'high')));
                            },
                            child: levelOfLanguage('Mid',10,30)),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ExamScreen(subject: 'German',level: 'high')));
                            },
                            child: levelOfLanguage('High',10,30)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Spanish',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ExamScreen(subject: 'Spanish',level: 'low')));
                            },
                            child: levelOfLanguage('Low',10,30)),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ExamScreen(subject: 'Spanish',level: 'mid')));
                            },
                            child: levelOfLanguage('Mid',10,30)),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ExamScreen(subject: 'Spanish',level: 'high')));
                            },
                            child: levelOfLanguage('High',10,30)),

                      ]),
                ))));
  }
}
