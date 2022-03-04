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

  Future _showAlertBox(BuildContext context, String msg) async {
    return showDialog(
      //Wrapping Alertbox with showDialog is complusory
      context: context,
      builder: (BuildContext context) {
        //return statement in alertBox is important
        return AlertDialog(content: Text("$msg"), actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(), child: Text("OK"))
        ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Flutter"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Text("Alert Box Widget"),
              ElevatedButton(
                  onPressed: () =>
                      _showAlertBox(context, "Hi this is a alert box"),
                  child: Text("Click ME"))
            ],
          ),
        ),
      ),
    );
  }
}
