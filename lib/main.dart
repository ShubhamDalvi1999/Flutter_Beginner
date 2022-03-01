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
  String _value = "";
  TextEditingController input = TextEditingController();
  int _val = 0;

  void _add() => setState(() {
        _val++;
      });

  void _remove() => setState(() {
        _val--;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello World"),
        backgroundColor: Colors.orangeAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _add,
        child: Icon(Icons.add),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Text(
                "$_val",
                style: TextStyle(fontSize: 79),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
