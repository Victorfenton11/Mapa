import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mapa/pages/discover.dart';
import 'package:mapa/pages/mapa.dart';
import 'package:mapa/pages/profile.dart';
import 'package:mapa/pages/travel.dart';
import '../constants.dart' as constants;

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
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(constants.GREY),
                    spreadRadius: 1.0,
                    blurRadius: 4.0,
                    offset: Offset(0.0, -3.0),
                  )
                ]
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  selectedFontSize: 0,
                  unselectedFontSize: 0,
                  backgroundColor: Colors.white,
                  onTap: (int index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: SvgPicture.asset(
                          "assets/plane.svg",
                          height: 40,
                          color: _pageIndex == 0? const Color(constants.GREEN) : Colors.black,
                        ),
                      ),
                      label: "Travel",
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: SvgPicture.asset(
                          "assets/world.svg",
                          height: 40,
                          color: _pageIndex == 1? const Color(constants.GREEN) : Colors.black,
                        ),
                      ),
                      label: "Discover",  
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: SvgPicture.asset(
                          "assets/friends.svg",
                          height: 40,
                          color: _pageIndex == 2? const Color(constants.GREEN) : Colors.black,
                        ),
                      ),
                      label: "Mapa",
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: SvgPicture.asset(
                          "assets/profile.svg",
                          height: 50,
                          color: _pageIndex == 3? const Color(constants.GREEN) : Colors.black,
                        ),
                      ),
                      label: "Profile"
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}