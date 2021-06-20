import 'package:flutter/material.dart';
import './calculator/Btn.dart';

// import './calculator/TextArea.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            centerTitle: true,
            title: Text(
              "SIMPLE CALCULATOR",
            ),
          ),
          body: Container(
            color: Colors.black54,
            child: Column(
              children: [Btn()],
            ),
          ),
        ));
  }
}
