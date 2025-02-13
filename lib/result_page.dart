import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.resultText,
      required this.bmiResult,
      required this.interpretation});

  String resultText;
  String bmiResult;
  String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.fromLTRB(10, 15, 0, 10),
            child: Text(
              'Your Result',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Color(0xFF1E1B31),
                  borderRadius: BorderRadius.circular(15)),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      resultText,
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    height: 85,
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 100),
                  ),
                  SizedBox(
                    height: 85,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    interpretation,
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 65,
              width: double.infinity,
              color: Colors.pink,
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
