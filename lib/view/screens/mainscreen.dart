import 'package:buddy1/view/screens/bottom_screens/search_screeen.dart';

import 'package:buddy1/view/screens/widgets/curved_nav.dart';
import 'package:buddy1/view_model/bottomNav_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bottom_screens/home_screen.dart';
import 'bottom_screens/message_screen.dart';
import 'bottom_screens/newPostChoose_screen.dart';
import 'bottom_screens/profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  final screens = const [
    HomeScreen(),
    SearchScreen1(),
    NewpostScreen(),
    MessageScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BottomNavigationBarProvider>();

    return Scaffold(
      body: screens[provider.currentIndex],
      bottomNavigationBar: CurvedNavBar(provider),
    );
  }
}
