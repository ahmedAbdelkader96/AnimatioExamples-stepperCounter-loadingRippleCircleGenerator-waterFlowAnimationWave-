import 'dart:async';
import 'package:flutter/material.dart';

class WaterFlow2 extends StatefulWidget {
  @override
  _WaterFlow2State createState() => _WaterFlow2State();
}

class _WaterFlow2State extends State<WaterFlow2> with TickerProviderStateMixin {
  AnimationController controller1;
  Animation<double> animation1;

  AnimationController controller2;
  Animation<double> animation2;

  AnimationController controller3;
  Animation<double> animation3;

  AnimationController controller4;
  Animation<double> animation4;

  @override
  void initState() {
    super.initState();

    controller1 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    animation1 = Tween<double>(begin: 1.9, end: 2.1)
        .animate(CurvedAnimation(parent: controller1, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });

    controller2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    animation2 = Tween<double>(begin: 1.8, end: 2.4)
        .animate(CurvedAnimation(parent: controller2, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });

    controller3 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    animation3 = Tween<double>(begin: 1.8, end: 2.4)
        .animate(CurvedAnimation(parent: controller3, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller3.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller3.forward();
        }
      });

    controller4 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    animation4 = Tween<double>(begin: 1.9, end: 2.1)
        .animate(CurvedAnimation(parent: controller4, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller4.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller4.forward();
        }
      });

    controller4.forward();

    Timer(Duration(milliseconds: 800), () {
      controller3.forward();
    });
    //
    Timer(Duration(milliseconds: 1600), () {
      controller2.forward();
    });
    //
    Timer(Duration(milliseconds: 2000), () {
      controller1.forward();
    });
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Center(
            child: Text(
              '50 %',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                wordSpacing: 3,
                color: Colors.transparent,
              ),
              textScaleFactor: w / 50,
            ),
          ),
          CustomPaint(
            painter: MyPainter(animation1.value, animation2.value,
                animation3.value, animation4.value),
            child: SizedBox(
              height: h,
              width: w,
            ),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double h1;
  final double h2;
  final double h3;
  final double h4;

  MyPainter(this.h1, this.h2, this.h3, this.h4);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint
      ..color = Colors.blue.withOpacity(0.9)
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, (size.height / h1)-100.00);

    path.cubicTo(size.width * .4, (size.height / h2)-100.00, size.width * .7,
        (size.height / h3)-100.00, size.width, (size.height / h4)-100.00);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}