import 'package:buddy1/view/screens/bottom_screens/newpost_screen.dart';
import 'package:buddy1/view/screens/splash.dart';
import 'package:buddy1/view_model/bottom_nav_view_model.dart';
import 'package:buddy1/tmp/converse_view_model.dart';
import 'package:buddy1/view_model/home_view_model.dart';
import 'package:buddy1/view_model/signin_view_model.dart';
import 'package:buddy1/view_model/signup_view_model.dart';
import 'package:buddy1/view_model/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SigninViewModel()),
        ChangeNotifierProvider(create: (context) => SignUpViewModel()),
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => NewPostProvider()),
        ChangeNotifierProvider(
            create: (context) => BottomNavigationBarProvider()),
        ChangeNotifierProvider(create: (context) => SplashViewModel()),
        //ChangeNotifierProvider(create: (context) => NewpostViewModel()),
        ChangeNotifierProvider(create: (context) => ConverseViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Chewy',
          inputDecorationTheme: const InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
