import 'package:bloc_login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: FlutterLogo(
          size: 40,
        ),
      ),
      body: LoginPage(),
    );
  }
}
