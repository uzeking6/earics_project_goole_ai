import 'package:avatar_glow/avatar_glow.dart';
import 'package:firstapp/views/camera.dart';
import 'package:firstapp/views/intensity_settings.dart';
import 'package:firstapp/views/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HardHearing extends StatefulWidget {
  const HardHearing({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HardHearingState createState() => _HardHearingState();
}

class _HardHearingState extends State<HardHearing> {
  HardHearing speechToText = HardHearing(
    title: 'speechtotext',
  );

  var height, width;
  var islistening = false;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(60, 193, 177, 1),
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(60, 193, 177, 1),
              ),
              height: height * 0.25,
              width: width,
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                        top: 55,
                        left: 15,
                        right: 15,
                      ),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                child: Icon(
                                  Icons.person_2_rounded,
                                  // color: Colors.grey,
                                  size: 40,
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 20, right: 300)),
                          Row(children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return Settings();
                                  },
                                ));
                              },
                              child: Icon(
                                Icons.settings,
                                // color: Colors.grey,
                                size: 40,
                              ),
                            ),
                            // Icon(
                            //   Icons.more_vert,
                            //   size: 40,
                            // )
                          ]),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 15,
                      right: 15,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Earics Dashbord",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              height: height * 0.75,
              width: width,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                    // width: 500,
                  ),
                  const SizedBox(height: 50),
                  // const Icon(
                  //   Icons.close,

                  //   size: 40,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 40,
          ),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.volume_up),
          ),
          SizedBox(width: 16),
          AvatarGlow(
              animate: islistening,
              duration: Duration(milliseconds: 2000),
              glowColor: Color.fromRGBO(60, 193, 177, 1),
              repeat: true,
              // repeatPauseDuration: Duration(milliseconds: 100),
              // showTwoGlows:true,
              child: GestureDetector(
                onTapDown: (details) {
                  setState(() {
                    islistening = true;
                  });
                },
                onTapUp: (details) {
                  setState(() {
                    islistening = false;
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Color.fromRGBO(60, 193, 177, 1),
                  radius: 35,
                  child: Icon(islistening ? Icons.mic : Icons.mic_none,
                      color: Colors.white),
                ),
              )),
          const SizedBox(
            width: 150,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return Camera();
                },
              ));
            },
            child: Icon(Icons.camera_alt_outlined),
          ),
        ],
      ),
    );
  }
}
