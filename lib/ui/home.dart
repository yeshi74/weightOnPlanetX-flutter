import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  /* 
  Weight on other planets..
  Source: https://www.livescience.com/33356-weight-on-planets-mars-moon.html
  Mercury: 0.38
  Venus: 0.91
  Earth: 1.00
  Mars: 0.38
  Jupiter: 2.34
  Saturn: 1.06
  Uranus: 0.92
  Neptune: 1.19
  Pluto: 0.06
  */
  final TextEditingController _weightController = new TextEditingController();

  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText = '';

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;

      switch(radioValue) {
        case 0: 
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _formattedText = "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
          case 1: 
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formattedText = "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";
          break;
          case 2: 
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formattedText = "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";
                }
              });
            }
          
            @override
            Widget build(BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('Weight On Planet X'),
                  backgroundColor: Colors.black,
                  centerTitle: true,
                ),
                backgroundColor: Colors.blueGrey,
                body: Container(
                  alignment: Alignment.topCenter,
                  child: ListView(
                    padding: const EdgeInsets.all(2.5),
                    children: <Widget>[
                      Image.asset(
                        'images/planet.png',
                        height: 133.0,
                        width: 200.0,
                      ),
                      Container(
                        margin: const EdgeInsets.all(3.0),
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            TextField(
                              controller: _weightController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Your weight on Earth',
                                hintText: 'In Kilograms',
                                icon: Icon(Icons.person_outline),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5.0),
                            ),
          
                            //three radio buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                //radio buttons
                                Radio<int>(
                                  activeColor: Colors.brown,
                                  value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged),
                                Text('Pluto',
                                style: TextStyle(color: Colors.white70),
                                ),
                                Radio<int>(
                                  activeColor: Colors.red,
                                  value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged),
                                Text('Mars',
                                style: TextStyle(color: Colors.white70),
                                ),
                                Radio<int>(
                                  activeColor: Colors.orangeAccent,
                                  value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged),
                                Text('Venus',
                                style: TextStyle(color: Colors.white70),
                                ),
                              ],
                            ),
                            SizedBox(height: 50.0,),
                            //Result Text
                            Text(
                              _weightController.text.isEmpty ? 'Please enter your weight' : '$_formattedText Kg.',
                              //'$_formattedText Kg.',
                              style: TextStyle(color: Colors.limeAccent,
                              fontSize: 20.0,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          
            double calculateWeight(String weight, double multiplier) {
              if(int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
                return int.parse(weight) * multiplier;
              } else {
                print("Wrong");
                return int.parse("180") * 0.38;
              }
            }
}
