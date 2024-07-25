import 'package:flutter/material.dart';
import 'package:flutter_application_1/More_Programs/Stopwatch2.dart';
//import 'package:flutter_application_1/More_Programs/Profilescreen.dart';
//import 'package:flutter_application_1/More_Programs/stopwatch.dart'; // Import the Stopwatch widget

//import 'package:flutter_application_1/More_Programs/basicscreen.dart';
//import 'package:flutter_application_1/utils/constant.dart';
// import 'package:flutter_application_1/More_Programs/disprow.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
     home: Stopwatch2Page(),
          
    );
  }
}
