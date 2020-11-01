
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moviebiz/Screens/Profile.dart';

import 'HomeScreen.dart';

class Logo extends StatefulWidget {
  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  void initState() {
    // TODO: implement initState

    Timer(Duration(seconds: 3),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Profile())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image(image: AssetImage('images/netflix_logo1.png'),width: 300,height: 80,)),
          //SizedBox(height: 400,),
        ],
      ),
    );
  }
}
