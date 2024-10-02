import 'package:flutter/material.dart';
import 'package:xo_game/home_screen.dart';
import 'package:xo_game/players_names.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/loginScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController player1NameControler = TextEditingController();
  TextEditingController player2NameControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('XO Game'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: height * .2,
            ),
            TextField(
                decoration:
                    const InputDecoration(hintText: 'Enter player 1 name (X)'),
                controller: player1NameControler),
            SizedBox(
              height: height * .02,
            ),
            TextField(
              decoration:
                  const InputDecoration(hintText: 'Enter player 2 name (O)'),
              controller: player2NameControler,
            ),
            SizedBox(
              height: height * .02,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(HomeScreen.routeName,
                    arguments: PlayersNames(
                        player1Name: player1NameControler.text,
                        player2Name: player2NameControler.text));
                player1NameControler.clear();
                player2NameControler.clear();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, foregroundColor: Colors.white),
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
