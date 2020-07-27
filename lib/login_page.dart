import 'package:bloc_login/pagetwo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bloc.dart';

class LoginPage extends StatelessWidget {
  final bloc = Bloc();

  changeToPageTwo(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PageTwo(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 60,
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height - 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Login',
              style: GoogleFonts.concertOne(
                textStyle: TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
            Column(
              children: [
                StreamBuilder<String>(
                  stream: bloc.email,
                  builder: (context, snapshot) => TextField(
                    onChanged: bloc.emailChanged,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      errorText: snapshot.error,
                    ),
                  ),
                ),
                StreamBuilder<String>(
                  stream: bloc.password,
                  builder: (context, snapshot) => TextField(
                    onChanged: bloc.passwordChanged,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Password",
                      errorText: snapshot.error,
                    ),
                  ),
                ),
              ],
            ),
            StreamBuilder(
              stream: bloc.submitCheck,
              builder: (context, snapshot) => RaisedButton(
                onPressed:
                    snapshot.hasData ? () => changeToPageTwo(context) : null,
                focusColor: Colors.lightBlueAccent,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(10),
                  //   color: Colors.blueAccent,
                  // ),
                  child: Text(
                    'Login',
                    style: GoogleFonts.karla(
                        textStyle: TextStyle(color: Colors.white),
                        fontSize: 15),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
