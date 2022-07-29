// @dart=2.9

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shop/Products/fproduct.dart';
import 'package:shop/Products/home.dart';
import 'package:shop/Products/new_arrivals.dart';
import 'package:shop/pages/Login/login.dart';
import 'package:shop/pages/Login/signing.dart';
import 'package:shop/profile/myprofile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: ThemeData(
        useMaterial3: true,
      ),
      home: Signing(),
    );
  }
}


