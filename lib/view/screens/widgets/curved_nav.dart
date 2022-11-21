import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../view_model/bottomNav_view_model.dart';

CurvedNavigationBar CurvedNavBar(BottomNavigationBarProvider provider) {
  return CurvedNavigationBar(
    // key: bottomNavigationKey,z

    index: provider.currentIndex,
    height: 60.0,
    items: const <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.search, size: 30),
      Icon(Icons.add_circle_rounded, size: 30),
      Icon(Icons.message, size: 30),
      Icon(Icons.person, size: 30),
    ],
    color: Colors.white,
    buttonBackgroundColor: Colors.white,
    backgroundColor: const Color.fromARGB(255, 252, 242, 254),
    animationCurve: Curves.easeInOut,
    animationDuration: const Duration(milliseconds: 600),

    onTap: (index) {
      provider.currentIndex = index;
    },
    letIndexChange: (index) => true,
  );
}
