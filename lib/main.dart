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
  final GlobalKey<ScaffoldState> _scaffoldstate = GlobalKey<ScaffoldState>();

  void _showsnackbar() {
    _scaffoldstate.currentState
        ?.showSnackBar(SnackBar(content: Text("Hello SnackBar")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldstate, //stateofScaffold
      appBar: AppBar(
        title: Text("Hello World"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Text("Snack Bar Widget"),
              ElevatedButton(onPressed: _showsnackbar, child: Text("Click ME"))
            ],
          ),
        ),
      ),
    );
  }
}
