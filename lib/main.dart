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
  TextEditingController _user = new TextEditingController();
  TextEditingController _pass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Flutter"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        children: [
          Text("Images"),
          Expanded(
            flex: 1,
            child: Image.asset(
                "images/space-2560x1600-apple-universe-wallpaper-preview.jpg"),
          ),
          Expanded(
              flex: 2,
              child: Image.asset("images/the-launch3840-×-2160-wallpaper.jpg"))
        ],
      ),
    );
  }
}
