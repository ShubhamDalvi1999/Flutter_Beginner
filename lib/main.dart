import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _value = "";
  TextEditingController input = TextEditingController();

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
              Text(_value),
              TextField(
                controller: input,
                decoration: InputDecoration(
                    hintText: "Enter text to see magic",
                    labelText: "Enter text"),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _value = input.text;
                    });
                  },
                  child: Text("Click me"))
            ],
          ),
        ),
      ),
    );
  }
}
