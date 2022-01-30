import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _value1 = 0.0;
  double _value2 = 100;

  void _onChange1(double value) => setState(() {
        _value1 = value;
      });

  void _onChange2(double value) => setState(() {
        _value2 = value;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New App"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Text("Value ${(_value1).round()}"),
              Slider(
                value: _value1,
                onChanged: _onChange1,
                max: 5.0,
                min: 0.0,
                label: "Amount of time:",
              )
            ],
          ),
        ),
      ),
    );
  }
}
