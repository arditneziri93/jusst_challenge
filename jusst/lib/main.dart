import 'package:flutter/material.dart';
import 'package:jusst/screens/main_scaffold.dart';
import 'package:jusst/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: S.appTitle,
      theme: C.themeData,
      home: MainScaffold(),
    );
  }
}
