import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tic_tac/models.dart';

List<bool> postion = [false, false, false, false, false, false, false, false, false];
late String usertype;
List<Item> itmes = [
  Item(
    1,
  ),
  Item(
    2,
  ),
  Item(
    3,
  ),
  Item(
    4,
  ),
  Item(
    5,
  ),
  Item(
    6,
  ),
  Item(
    7,
  ),
  Item(
    8,
  ),
  Item(
    9,
  )
];

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  String username;
  String userposition;
  MainPage({super.key, required this.username, required this.userposition});
  settype() async {
    await (usertype = userposition);
  }

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
                    children: <Widget>[for (indexitems = 0; indexitems < 3; indexitems++) itmes[indexitems]],
                  ),
                  const Divider(
                    color: Color(0xffCCB893),
                    thickness: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[for (int indexitems = 3; indexitems < 6; indexitems++) itmes[indexitems]],
                  ),
                  const Divider(
                    color: Color(0xffCCB893),
                    thickness: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[for (int indexitems = 6; indexitems < 9; indexitems++) itmes[indexitems]],
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
                    onLongPress: () {},
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

// ignore: must_be_immutable
class Item extends StatefulWidget {
  int id;
  String lable;
  // ignore: use_key_in_widget_constructors
  Item(this.id, [this.lable = ""]);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  Widget checkcontainer() {
    if (widget.lable == "O") {
      return Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("images/o.png"))),
      );
    } else if (widget.lable == "X") {
      return Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("images/x.png"))),
      );
    } else {
      return InkWell(
        onTap: () {
          itmes.forEach((element) {
            if (element.id == widget.id) {
              element.lable = "O";
              int i = itmes.indexOf(element);
              postion[i] = true;
            }
          });
          int randomindex = makeRandomTrue(postion);
          postion[randomindex] = true;
          itmes.forEach((element) {
            print(randomindex);
            if (element.id == randomindex) {
              element.lable = "X";
            }
          });
          setState(() {});
        },
        child: const SizedBox(
          height: 50,
          width: 50,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return checkcontainer();
  }
}
