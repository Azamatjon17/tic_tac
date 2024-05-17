import 'package:flutter/material.dart';
import 'package:tic_tac/secondpage.dart';

void main() {
  runApp(const MaterialApp(
    home: LoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller = TextEditingController();

  String selectBottom = ""; // Initially empty

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        padding: const EdgeInsets.fromLTRB(40, 80, 40, 50),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Column(
              children: <Widget>[
                TextField(
                  style: const TextStyle(fontSize: 25),
                  controller: _controller,
                  textAlign: TextAlign.center,
                  onSubmitted: (value) {},
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(gapPadding: 5),
                    labelText: 'Name',
                  ),
                ),
                DropdownButton<String>(
                  value: selectBottom.isNotEmpty ? selectBottom : null,
                  hint: const Text("Select X or O"),
                  items: const [
                    DropdownMenuItem<String>(
                      value: "O",
                      child: Text(
                        "O",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: "X",
                      child: Text(
                        "X",
                        style: TextStyle(fontSize: 25),
                      ),
                    )
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      selectBottom = value ?? "";
                    });
                  },
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty && selectBottom.isNotEmpty) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainPage(
                                username: _controller.text,
                                userposition: selectBottom,
                              )));
                } else {
                  // Show a message if either the name or selection is missing
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Ismngizni va x yoki o ni tanlash majburiy")),
                  );  
                }
              },
              child: const Text(
                "START",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
