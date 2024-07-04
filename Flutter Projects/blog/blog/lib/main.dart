import 'package:blog/theme.dart';
import 'package:flutter/material.dart';
import 'screens/change_password.dart';
import 'screens/feedback_screen.dart';
import 'screens/forgor_password.dart';
import 'screens/home_page.dart';
import 'screens/menu_page.dart';
import 'screens/read_screen.dart';
import 'screens/sign_up.dart';
import 'screens/sing_in.dart';
import 'screens/splase_scrren.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      currentTheme.addListener(() {
        setState(() {});
      });
    }
    return MaterialApp(
      themeMode: currentTheme.currentTheme,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      title: "blog app",
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => SplaseScrren(),
        "/HomePage":(context)=>HomePage(),
        "/MenuPage":(context) => MenuPage(),
        "/ReadScreen":(context)=>ReadScreen(),
        "/Feedbacks":(context)=>Feedbacks(),
        "/SignIn":(context)=>SignIn(),
        "/SignUp":(context) => SignUp(),
        "/ForgorPassword":(context) => ForgorPassword(),
        "/ChangePassword":(context) => ChangePassword(),
      },
    );
  }
}
