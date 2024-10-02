import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xo_game/players_names.dart';
import 'package:xo_game/xo_button.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> board = List.filled(9, '');
  int player1Score = 0;
  int player2Score = 0;
  @override
  Widget build(BuildContext context) {
    PlayersNames args =
        ModalRoute.of(context)!.settings.arguments as PlayersNames;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        '${args.player1Name} (x)',
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '$player1Score',
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '${args.player2Name} (O)',
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '$player2Score',
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      mainAxisExtent: MediaQuery.sizeOf(context).height * .28),
                  itemBuilder: (_, index) => XoButton(
                        label: board[index],
                        OnPressed: onClicked,
                        index: index,
                      )),
            )
          ],
        ),
      ),
    );
  }

  int round = 1;
  onClicked(int index) {
    if (board[index].isNotEmpty) return;
    if (round.isOdd) {
      board[index] = 'X';
      if (checkwinner('X')) {
        player1Score++;
        clearBored();
        return;
      }
    } else {
      board[index] = 'O';
      if (checkwinner('O')) {
        player2Score++;
        clearBored();
        return;
      }
    }
    round++;
    if (round == 10) {
      clearBored();
      return;
    }
    setState(() {});
  }

  bool checkwinner(String sympol) {
    if (round <= 4) {
      return false;
    }
    if (board[0] == sympol && board[4] == sympol && board[8] == sympol) {
      return true;
    }
    if (board[2] == sympol && board[4] == sympol && board[6] == sympol) {
      return true;
    }
    for (int i = 0; i <= 6; i += 3) {
      if (board[i] == sympol &&
          board[i + 1] == sympol &&
          board[i + 2] == sympol) {
        return true;
      }
    }

    for (int i = 0; i <= 2; i++) {
      if (board[i] == sympol &&
          board[i + 3] == sympol &&
          board[i + 6] == sympol) {
        return true;
      }
    }

    return false;
  }

  void clearBored() {
    board = List.filled(9, '');
    round = 1;
    setState(() {});
  }
}
