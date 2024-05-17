import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

List<int> indexpress = [];

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  String username;
  String userposition;
  MainPage({super.key, required this.username, required this.userposition});

  @override
  // ignore: no_logic_in_create_state
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int comprate = 0;
  int userrate = 0;
  int indexitems = 0;
  @override
  void initState() {
    indexitems = 0;
  }

  List<String> itmes = ["", "", "", "", "", "", "", "", ""];
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      for (int i  = 0; i < 3; i++)
                        InkWell(
                          onTap: () {
                            if (itmes[i] == "") {
                              indexpress.add(i);
                              if (widget.userposition == "X") {
                                itmes[i] = "X";
                                int randomIndex = Random().nextInt(9);
                                while (indexpress.contains(randomIndex)) {
                                  randomIndex = Random().nextInt(9);
                                }
                                itmes[i] = "O";
                              } else {
                                itmes[i] = "O";
                                int randomIndex = Random().nextInt(9);
                                while (indexpress.contains(randomIndex)) {
                                  randomIndex = Random().nextInt(9);
                                }
                                itmes[i] = "X";
                              }
                              setState(() {});
                            } 
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(boxShadow: const [BoxShadow(blurRadius: 0, spreadRadius: 3, color: Color(0xffCCB893))], borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              itmes[indexitems],
                              style: const TextStyle(fontSize: 25),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      for (indexitems; indexitems < 6; indexitems += 1)
                        InkWell(
                          onTap: () {
                            if (itmes[indexitems] == "") {
                              indexpress.add(indexitems);
                              if (widget.userposition == "X") {
                                itmes[indexitems] = "X";
                                int randomIndex = Random().nextInt(9);
                                while (indexpress.contains(randomIndex)) {
                                  randomIndex = Random().nextInt(9);
                                }
                                itmes[randomIndex] = "O";
                              } else {
                                itmes[indexitems] = "O";
                                int randomIndex = Random().nextInt(9);
                                while (indexpress.contains(randomIndex)) {
                                  randomIndex = Random().nextInt(9);
                                }
                                itmes[randomIndex] = "X";
                              }
                              setState(() {});
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(boxShadow: const [BoxShadow(blurRadius: 0, spreadRadius: 3, color: Color(0xffCCB893))], borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              itmes[indexitems],
                              style: const TextStyle(fontSize: 25),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      for (indexitems; indexitems < 9; indexitems += 1)
                        InkWell(
                          onTap: () {
                            if (itmes[indexitems] == "") {
                              indexpress.add(indexitems);
                              if (widget.userposition == "X") {
                                itmes[indexitems] = "X";
                                int randomIndex = Random().nextInt(9);
                                while (indexpress.contains(randomIndex)) {
                                  randomIndex = Random().nextInt(9);
                                }
                                itmes[randomIndex] = "O";
                              } else {
                                itmes[indexitems] = "O";
                                int randomIndex = Random().nextInt(9);
                                while (indexpress.contains(randomIndex)) {
                                  randomIndex = Random().nextInt(9);
                                }
                                itmes[randomIndex] = "X";
                              }
                              setState(() {});
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(boxShadow: const [BoxShadow(blurRadius: 0, spreadRadius: 3, color: Color(0xffCCB893))], borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              itmes[indexitems],
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
                    onLongPress: () {},
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Color(0xff388085)),
                      child: const Text(
                        "NEW GAME",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  const Gap(20),
                  InkWell(
                    onLongPress: () {
                      setState(() {
                        itmes.clear();
                        itmes = ["", "", "", "", "", "", "", "", ""];
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Color(0xff388085)),
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


checkwinn(List boxes){
  String checkWin() {
    if (boxes[0] == "X" && boxes[1] == "X" && boxes[2] == "X") {
      return "X";
    } else if (boxes[3] == "X" && boxes[4] == "X" && boxes[5] == "X") {
      return "X";
    } else if (boxes[6] == "X" && boxes[7] == "X" && boxes[8] == "X") {
      return "X";
    } else if (boxes[0] == "X" && boxes[3] == "X" && boxes[6] == "X") {
      return "X";
    } else if (boxes[1] == "X" && boxes[4] == "X" && boxes[7] == "X") {
      return "X";
    } else if (boxes[2] == "X" && boxes[5] == "X" && boxes[8] == "X") {
      return "X";
    } else if (boxes[0] == "X" && boxes[4] == "X" && boxes[8] == "X") {
      return "X";
    } else if (boxes[2] == "X" && boxes[4] == "X" && boxes[6] == "X") {
      return "X";
    }

    if (boxes[0] == "O" && boxes[1] == "O" && boxes[2] == "O") {
      return "O";
    } else if (boxes[3] == "O" && boxes[4] == "O" && boxes[5] == "O") {
      return "O";
    } else if (boxes[6] == "O" && boxes[7] == "O" && boxes[8] == "O") {
      return "O";
    } else if (boxes[0] == "O" && boxes[3] == "O" && boxes[6] == "O") {
      return "O";
    } else if (boxes[1] == "O" && boxes[4] == "O" && boxes[7] == "O") {
      return "O";
    } else if (boxes[2] == "O" && boxes[5] == "O" && boxes[8] == "O") {
      return "O";
    } else if (boxes[0] == "O" && boxes[4] == "O" && boxes[8] == "O") {
      return "O";
    } else if (boxes[2] == "O" && boxes[4] == "O" && boxes[6] == "O") {
      return "O";
    }

    return "";
  }

}