import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';

class SplaseScreen extends StatefulWidget {
  SplaseScreen({Key? key}) : super(key: key);

  @override
  State<SplaseScreen> createState() => _SplaseScreenState();
}

class _SplaseScreenState extends State<SplaseScreen> {
  @override
   @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
          ()=>Navigator.pushReplacementNamed(context, "/home")
         );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: Colors.red[700],
            ),
            Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.api,
                            color: Colors.red[700],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Text(
                        "Api App",
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(color: Colors.white)),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
