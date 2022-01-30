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
  bool _value1 = true;
  bool _value2 = true;

  void _onChange1(bool value) => setState(() {
        _value1 = value;
      });

  void _onChange2(bool value) => setState(() {
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
              Switch(value: _value2, onChanged: _onChange2),
              SizedBox(
                height: 34,
              ),
              SwitchListTile(
                value: _value1,
                onChanged: _onChange1,
                title: Text("Switch to a functionality "),
                subtitle: Text("Hi there!!"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
