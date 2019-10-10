import 'package:flutter/material.dart';
import 'package:note_ev02/ui/Login.dart';
import 'package:note_ev02/ui/notes_list.dart';
import 'package:note_ev02/ui/signup.dart';
import 'package:note_ev02/ui/try.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: LoginPage(),
    );
  }
}

