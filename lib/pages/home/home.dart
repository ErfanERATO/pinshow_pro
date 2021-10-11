// import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:pinshow/api/api_verifyPhone.dart';
// import 'package:pinshow/pages/Login/login_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String routeName = "/pages.home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: (){},
          ),
        ],
      ),
      body: const Center(
        child: Text("Home Page"),
      ),
    );
  }
}
