import 'package:buddy1/view/screens/bottom_screens/search_screeen.dart';

import 'package:buddy1/view/screens/widgets/curved_nav.dart';
import 'package:buddy1/view_model/bottom_nav_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bottom_screens/choose_screen.dart';
import 'bottom_screens/home_screen.dart';
import '../../tmp/conversations_screen.dart';
import '../../tmp/post_choose.dart';
import 'bottom_screens/profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  final screens = const [
    HomeScreen(),
    SearchScreen1(),
    NewPostChooseScreen(),
    MessageScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BottomNavigationBarProvider>();

    return Scaffold(
      body: screens[provider.currentIndex],
      bottomNavigationBar: curvedNavBar(provider),
    );
  }
}
