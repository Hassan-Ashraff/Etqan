import'package:flutter/material.dart';
Card levelOfLanguage(String level,int numberOfQuestions, int timer){
  return  Card(
    color: Color(0xffF9FAFA),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$timer : Minutes',
                      style: TextStyle(
                          color: Color(0xffC246BE),
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    Text(
                      '$level level',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  '$numberOfQuestions : Questions',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(height: 10),
                // From and To
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'From: 1.00',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'To: 6.00',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          ImageIcon(AssetImage('assets/Images/grades.png'),
            color: Color(0xffC246BE),
            size: 35,)

        ],
      ),
    ),
  );

}