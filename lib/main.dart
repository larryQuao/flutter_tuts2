import 'package:flutter/material.dart';
// import 'package:second/form.dart';
// import 'package:second/form2.dart';
// import 'package:second/form3.dart';
// import 'package:second/form4.dart';
// import 'package:second/form5.dart';
// import 'package:second/form6.dart';
import 'package:second/form7.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final title = '3.2 Flutter Push Pop';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData.light(),
      home: const MyForm(),
    );
  }
}
