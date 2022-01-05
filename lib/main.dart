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
  int _value = 0;

  void _onClick() {
    setState(() {
      _value++;
    });
  }

  void _onMinus() {
    setState(() {
      _value--;
    });
  }

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
              Text(_value.toString()),
              SizedBox(
                height: 20,
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  _onClick();
                },
              ),
              SizedBox(
                height: 20,
              ),
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  _onMinus();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
