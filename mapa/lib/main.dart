import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapa/pages/homepage.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import 'package:mapa/pages/landing/landing.dart';

void main() {
  runApp( MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mapa",
      home: HomePage(),
    );
  }
}