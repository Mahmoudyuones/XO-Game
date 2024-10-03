import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xo_game/home_screen.dart';
import 'package:xo_game/login_screen.dart';

main() {
  runApp(XOApp());

  ///
}

//asdfasdf
//adfsafs
//adfasdf
class XOApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        LoginScreen.routeName: (_) => LoginScreen()
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}
