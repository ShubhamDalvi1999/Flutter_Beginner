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
  // void _showmodel() {
  //   showBottomSheet(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return Container(
  //           padding: EdgeInsets.all(10.0),
  //           child: Row(children: [
  //             Text("no data to dispaly"),
  //             ElevatedButton(
  //                 onPressed: () => Navigator.pop(context), child: Text("Close"))
  //           ]),
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello World"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Text("dsfa"),
              ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: EdgeInsets.all(10.0),
                            child: Row(children: [
                              Text("no data to dispaly"),
                              ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("Close"))
                            ]),
                          );
                        });
                  },
                  child: Text("Click ME"))
            ],
          ),
        ),
      ),
    );
  }
}
