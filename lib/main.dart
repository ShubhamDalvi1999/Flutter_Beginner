import 'package:flutter/cupertino.dart';
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
  bool _value1 = false;
  bool _value2 = true;

  void _value1Changed(bool? value) => setState(() {
        _value1 = value!;
      });

  void _value2Changed(bool? value) => setState(() {
        _value2 = value!;
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
              Checkbox(value: _value1, onChanged: _value1Changed),
              CheckboxListTile(value: _value2, onChanged: _value2Changed),
            ],
          ),
        ),
      ),
    );
  }
}
