import 'package:firstapp/views/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firstapp/room/join_room.dart'; // Import JoinRoom class

import '../models/button.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key, required String title});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              //   // Navigate to JoinRoom page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JoinRoom()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    'Join Room',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromRGBO(122, 198, 189, 1),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                      color: Color.fromRGBO(122, 198, 189, 1),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward,
                    color: Color.fromRGBO(122, 198, 189, 1),
                    size: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(top: 100, bottom: 25, left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "lib/assets/image.png",
                height: screenHeight * 0.3,
              ),
              // ... other UI elements
              Button(
                text: "Get Started with earics",
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        Register(title: 'register'),
                  ));
                },
                width: screenHeight * 0.5,
                color: Color.fromRGBO(60, 193, 177, 100),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
