import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapa/pages/discover.dart';
import 'package:mapa/pages/homepage.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import 'package:mapa/pages/landing/landing.dart';

void main() {
  runApp( const MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mapa",
      home: Discover(),
    );
  }
}