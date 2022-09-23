import 'package:flutter/material.dart';
import 'package:trabajo_2/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solemne 2 UNAB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      // home: Home(title: 'Home'),
      debugShowCheckedModeBanner: false,
    );
  }
}
