import 'package:flutter/material.dart';
import 'package:bmi/constants/app_constants.dart';
import 'package:bmi/widgets/left_bar.dart';
import 'package:bmi/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmiResult = 0;
  String textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: accentColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: heightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w100,
                        color: accentColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Height',
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: accentColor)),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: weightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w100,
                        color: accentColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Weight',
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: accentColor)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                double height = double.parse(heightController.text);
                double weight = double.parse(weightController.text);
                height *= 0.3048;
                setState(() {
                  bmiResult = weight / (height * height);
                  if (bmiResult > 25) {
                    textResult = "You\'re Over weight";
                  } else if (bmiResult >= 18.5 && bmiResult <= 25) {
                    textResult = "You have a normal weight";
                  } else {
                    textResult = "You\'re Under weight";
                  }
                });
              },
              child: Text(
                "calculate",
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: accentColor),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                bmiResult.toStringAsFixed(2),
                style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    color: accentColor),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Visibility(
                visible: textResult.isNotEmpty,
                child: Container(
                  child: Text(
                    textResult,
                    style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: accentColor),
                  ),
                )),
            SizedBox(
              height: 30,
            ),
            LeftBar(barWidth: 40),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 70),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 40),
            SizedBox(
              height: 20,
            ),
            RightBar(barWidth: 50),
            SizedBox(
              height: 20,
            ),
            RightBar(barWidth: 50),
          ],
        ),
      ),
    );
  }
}
