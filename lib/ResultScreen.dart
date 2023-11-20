// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResultScreen extends StatelessWidget {
  final bmiModel;
  const ResultScreen({this.bmiModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              height: 200,
              child: bmiModel.isNormal
                  ? SvgPicture.asset(
                      "assets/images/bmi.svg",
                      fit: BoxFit.contain,
                    )
                  : SvgPicture.asset(
                      "assets/images/bmi.svg",
                      fit: BoxFit.contain,
                    ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Your Bmi is ${bmiModel.bmi} ",
              style: TextStyle(
                  color: Colors.red[600],
                  fontSize: 28,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    ));
  }
}
