import 'package:flutter/material.dart';

class Travel extends StatefulWidget {
  const Travel({super.key});

  @override
  State<Travel> createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 100.0, bottom: 50.0),
              child: Text(
                "Travel",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 25.0),
              child: SearchBar(
                hintText: "Where to?",
                backgroundColor: WidgetStatePropertyAll(Colors.white),
              ),
            )
          ],
        ),
      )
    );
  }
}
