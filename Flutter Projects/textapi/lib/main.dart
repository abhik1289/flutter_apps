import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/splase_scrren.dart';
import 'screens/user_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,title: "apiapp",routes: {
      "/":(context) => SplaseScreen(),
      "/home":(context) => HomeScreen(),
      "/user":(context) => UserScrren(),

    },);
  }
}



