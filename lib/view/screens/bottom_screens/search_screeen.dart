import 'package:buddy1/view/screens/bottom_screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/push_functions.dart';

class SearchScreen1 extends StatelessWidget {
  const SearchScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
          onPressed: () {
            PushFunctions.pushAndRemoveUntil(context, const HomeScreen());
          },
        ),
        title: const CupertinoSearchTextField(),
      ),
    );
  }
}
