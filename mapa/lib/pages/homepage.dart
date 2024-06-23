import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapa/pages/discover.dart';
import 'package:mapa/pages/mapa.dart';
import 'package:mapa/pages/profile.dart';
import 'package:mapa/pages/travel.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  final List<Widget> _tabList = [
    Travel(),
    Discover(),
    Mapa(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _tabList.elementAt(_pageIndex),
          Align(
            alignment: Alignment(0.0, 1.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Color(0xFF91D670),
                unselectedItemColor: Colors.black,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: Colors.white,
                onTap: (int index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Typicons.plane_outline),
                    label: "Travel",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.public),
                    label: "Discover",  
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.group_outlined),
                    label: "Mapa",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.map),
                    label: "Profile"
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}