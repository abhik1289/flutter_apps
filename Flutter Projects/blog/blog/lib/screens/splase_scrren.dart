import 'dart:async';

import 'package:flutter/material.dart';

class SplaseScrren extends StatefulWidget {
  SplaseScrren({Key? key}) : super(key: key);

  @override
  State<SplaseScrren> createState() => _SplaseScrrenState();
}

class _SplaseScrrenState extends State<SplaseScrren> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, "/HomePage"));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: SafeArea(
            child: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: theme.primaryColor,
        ),
        Container(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  child: const CircleAvatar(
                    radius: 50.0,
                    child: Icon(
                      Icons.local_library,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      "Blog App",
                      style: theme.textTheme.headline4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Read amazing blogs and grow\n your knowledge",
                        style: theme.textTheme.subtitle2,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    )));
  }
}
