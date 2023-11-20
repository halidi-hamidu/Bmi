// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, unnecessary_new
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:hello_world_app/ResultScreen.dart';
import './BmiModel.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  double _heightOfUser = 0;
  double _weightOfUser = 0;
  double _bmi = 0;
  late BmiModel _bmiModel;
  late bool isNormal = false;
  late bool isUnderweight = false;
  late bool isOverweight = false;
  late bool isObesed = false;

  late String comments;

  bmiCalculator(double bmi) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                width: 200,
                height: 200,
                child: SvgPicture.asset("assets/images/bmi.svg"),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Bmi Calculator",
                style: TextStyle(
                    color: Colors.red[600],
                    fontSize: 28,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "We care about your Health",
                style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 15,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Height (cm)",
                style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 15,
                    fontWeight: FontWeight.w300),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 0,
                  max: 250.0,
                  onChanged: (height) {
                    setState(() {
                      _heightOfUser = height;
                    });
                  },
                  value: _heightOfUser,
                  divisions: 100,
                  activeColor: Colors.red,
                  label: "$_heightOfUser",
                ),
              ),
              Text(
                "$_heightOfUser (cm)",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "weight (kg)",
                style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 15,
                    fontWeight: FontWeight.w300),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Slider(
                  min: 0,
                  max: 400.0,
                  onChanged: (weight) {
                    setState(() {
                      _weightOfUser = weight;
                    });
                  },
                  value: _weightOfUser,
                  divisions: 100,
                  activeColor: Colors.red,
                  label: "$_weightOfUser",
                ),
              ),
              Text(
                "$_weightOfUser (kg)",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                // child: Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: isUnderweight
                            ? Container(
                                color: const Color.fromARGB(255, 1, 134, 250),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Text(
                                  "Your are Underweight",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            : isNormal
                                ? Container(
                                    color:
                                        const Color.fromARGB(255, 69, 233, 77),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Text(
                                      "Your are Normal",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                : isOverweight
                                    ? Container(
                                        color: Colors.orange[400],
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 20),
                                        child: Text(
                                          "Your are Overweight",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    : isObesed
                                        ? Container(
                                            color: const Color.fromARGB(
                                                255, 255, 17, 0),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 20),
                                            child: Text(
                                              "You are Obesed",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )
                                        : Text(""),
                      ),
                    ],
                  ),
                ),
                // ),
              ),
              SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _bmi = _weightOfUser /
                          ((_heightOfUser / 100) * (_heightOfUser / 100));
                      print(_bmi);
                      if (_bmi >= 18.5 && _bmi <= 25) {
                        isNormal = true;
                        isUnderweight = false;
                        isOverweight = false;
                        isObesed = false;
                        // _bmiModel = BmiModel(
                        //     bmi: _bmi,
                        //     isNormal: true,
                        //     comments: "Your are Normalweight");
                      } else if (_bmi > 18.5) {
                        isUnderweight = true;
                        isNormal = false;
                        isOverweight = false;
                        isObesed = false;

                        // _bmiModel = BmiModel(
                        //     bmi: _bmi,
                        //     isNormal: false,
                        //     comments: "Your are Underweight");
                      } else if (_bmi > 25 && _bmi <= 30) {
                        isOverweight = true;
                        isNormal = false;
                        isObesed = false;
                        isUnderweight = false;
                        // _bmiModel = BmiModel(
                        //     bmi: _bmi,
                        //     isNormal: false,
                        //     comments: "Your are Overweight");
                      } else {
                        isObesed = true;
                        isUnderweight = false;
                        isNormal = false;
                        isOverweight = false;
                        // _bmiModel = BmiModel(
                        //     bmi: _bmi,
                        //     isNormal: false,
                        //     comments: "Your are Obesed");
                      }
                    });

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ResultScreen()));
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  label: Text("CALCULATE"),
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(500, 40)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
