import 'package:body_mask_index_calculator/calculator_brain.dart';
import 'package:body_mask_index_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'package:flutter/services.dart';

final inActiveColor = Color(0xFF121124);
final activeColor = Color(0xFF1E1B31);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              color: Color(0xFF0c0e1e),
              titleTextStyle: TextStyle(
                  color: Color(0xFFedf2ef),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              iconTheme: IconThemeData(color: Colors.white)),
          scaffoldBackgroundColor: Color(0xFF0E1020),
        ),
        home: InputPage());
  }
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inActiveColor;
  Color femaleCardColor = inActiveColor;

  void updateColor(String gender) {
    if (gender == 'male') {
      if (maleCardColor == inActiveColor) {
        maleCardColor = activeColor;
        femaleCardColor = inActiveColor;
      } else {
        maleCardColor = inActiveColor;
      }
    }
    if (gender == 'female') {
      if (femaleCardColor == inActiveColor) {
        femaleCardColor = activeColor;
        maleCardColor = inActiveColor;
      } else {
        femaleCardColor = inActiveColor;
      }
    }
  }

  int height = 160;
  int weight = 50;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateColor('male');
                    });
                  },
                  child: ReusableCard(
                    colour: maleCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.mars,
                          color: Colors.white,
                          size: 80,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'MALE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateColor('female');
                    });
                  },
                  child: ReusableCard(
                    colour: femaleCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.venus,
                          color: Colors.white,
                          size: 80,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'FEMALE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: 1),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: Color(0xFF1E1B31),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 1),
                      ),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            height.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            'cm',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30),
                            thumbColor: Color(0xFFea0f4b),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.grey),
                        child: Slider(
                          value: height.toDouble(),
                          min: 100,
                          max: 240,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: Color(0xFF1E1B31),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 1),
                      ),
                      Text(
                        weight.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 50),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: null,
                            shape: CircleBorder(),
                            backgroundColor: Color(0xFF424152),
                            onPressed: () {
                              setState(
                                () {
                                  if (weight > 1) {
                                    weight--;
                                  }
                                },
                              );
                            },
                            child: Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          FloatingActionButton(
                            heroTag: null,
                            shape: CircleBorder(),
                            backgroundColor: Color(0xFF424152),
                            onPressed: () {
                              setState(
                                () {
                                  weight++;
                                },
                              );
                            },
                            child: Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: Color(0xFF1E1B31),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 1),
                      ),
                      Text(
                        age.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 50),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: null,
                            shape: CircleBorder(),
                            backgroundColor: Color(0xFF424152),
                            onPressed: () {
                              setState(
                                () {
                                  if (age > 1) {
                                    age--;
                                  }
                                },
                              );
                            },
                            child: Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          FloatingActionButton(
                            heroTag: null,
                            shape: CircleBorder(),
                            backgroundColor: Color(0xFF424152),
                            onPressed: () {
                              setState(
                                () {
                                  age++;
                                },
                              );
                            },
                            child: Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                color: Colors.pink,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
