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
          SizedBox(
            height: 50,
          ),
          Card(
            child: Center(
              child: Column(
                children: [
                  Text("Please Login"),
                  Row(
                    children: [
                      Text("Username"),
                      // TextField(
                      //   controller: _user,
                      // ) //cannot do thiss
                      Expanded(
                          child: TextField(
                        controller: _user,
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      Text("Password"),
                      // TextField(
                      //   controller: _user,
                      // ) //cannot do thiss
                      Expanded(
                          child: TextField(
                        controller: _pass,
                        obscureText: true,
                      ))
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () => {},
                        child: Text("Login"),
                      )),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Card(
            color: Colors.yellow,
            child: Center(
              child: Column(
                children: [
                  Text("Hello Card"),
                  Text("Hello Card"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
