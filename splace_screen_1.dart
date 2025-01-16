import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rushi161/Layout/tab.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 3600), () {
      // print(':::::DEMO SCREEN:::::');
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => TabBar1(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.asset('assets/image/360_F_442621279_PYhie13pVGcSSYTAm1eqlC3e7Lcy0oNV.jpg'),
      ),
    );
  }
}
