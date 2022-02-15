import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stepper/custom1.dart';
import 'package:stepper/custom2.dart';
import 'package:stepper/ripple.dart';

import 'stepper/src/stepper.dart';

void main() => runApp(
  MaterialApp(
    theme: ThemeData(
      scaffoldBackgroundColor: const Color(0xFF6D72FF),
    ),
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ),
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: SafeArea(
          child: Stack(
            children: [
              WaterFlow2(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50,bottom: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[


                      RipplesAnimation(),
                      CustomPainter1(),


                      StepperTouch(
                        counterColor: Colors.white,
                        dragButtonColor:Colors.blue.withOpacity(0.9),
                        buttonsColor: Colors.blue.withOpacity(0.9),
                        initialValue: 0,
                        onChanged: (int value) => print('new value $value'),
                      ),



                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
