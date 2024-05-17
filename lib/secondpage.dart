import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

List<int> indexpress = [];

class MainPage extends StatefulWidget {
  final String username;
  final String userposition;
  MainPage({super.key, required this.username, required this.userposition});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int comprate = 0;
  int userrate = 0;
  List<String> items = List.filled(9, "");

  @override
  void initState() {
    super.initState();
    items = List.filled(9, "");
    indexpress.clear();
  }

  void handleTap(int index) {
    if (items[index] == "") {
      setState(() {
        items[index] = widget.userposition;
        indexpress.add(index);
        if (checkWin(items) == "") {
          makeComputerMove();
        }
        String winner = checkWin(items);
        if (winner.isNotEmpty) {
          showWinDialog(winner);
          if (winner == widget.userposition) {
            userrate++;
          } else if (winner == "O" || winner == "X") {
            comprate++;
          }
        } else if (!items.contains("")) {
          showWinDialog("Draw");
        }
      });
    }
  }

  void makeComputerMove() {
    int randomIndex = Random().nextInt(9);
    while (items[randomIndex] != "") {
      randomIndex = Random().nextInt(9);
    }
    items[randomIndex] = widget.userposition == "X" ? "O" : "X";
    indexpress.add(randomIndex);
  }

  String checkWin(List<String> boxes) {
    const List<List<int>> winPositions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var positions in winPositions) {
      String a = boxes[positions[0]];
      String b = boxes[positions[1]];
      String c = boxes[positions[2]];
      if (a.isNotEmpty && a == b && a == c) {
        return a;
      }
    }
    return "";
  }

  void showWinDialog(String winner) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(winner == "Draw" ? "It's a Draw!" : "$winner Wins!"),
          actions: <Widget>[
            TextButton(
              child: const Text("New Game"),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  items = List.filled(9, "");
                  indexpress.clear();
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(105, 153, 154, 1),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(40, 80, 40, 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.username,
                  style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const Gap(5),
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                    text: "Your position is   ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  TextSpan(
                    text: widget.userposition,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ])),
                const Gap(20),
                Text(
                  "$userrate : $comprate",
                  style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 250,
              width: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  for (int i = 0; i < 9; i += 3)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        for (int j = i; j < i + 3; j++)
                          InkWell(
                            onTap: () => handleTap(j),
                            child: Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                boxShadow: const [BoxShadow(blurRadius: 0, spreadRadius: 3, color: Color(0xffCCB893))],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                items[j],
                                style: const TextStyle(fontSize: 25),
                              ),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        userrate = 0;
                        comprate = 0;
                        items = List.filled(9, "");
                        indexpress.clear();
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: const Color(0xff388085)),
                      child: const Text(
                        "NEW GAME",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  const Gap(20),
                  InkWell(
                    onTap: () {
                      setState(() {
                        items = List.filled(9, "");
                        indexpress.clear();
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: const Color(0xff388085)),
                      child: const Text(
                        "RESET GAME",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
