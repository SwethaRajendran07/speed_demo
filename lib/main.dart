import 'package:flutter/material.dart';

void main() {
  runApp(
    CarSpeed(),
  );
}

class CarSpeed extends StatefulWidget {
  const CarSpeed({Key? key}) : super(key: key);

  @override
  State<CarSpeed> createState() => _CarSpeedState();
}

class _CarSpeedState extends State<CarSpeed> {
  late Color speedColor;
  double carSpeed = 60.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Image.asset(
                "images/Car.png",
                color: speedColor = carSpeed >= 100.0 ? Colors.yellow : Colors.blue,
                width: 50,
                height: 50,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "1",
                  style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: carSpeed >= 100.0,
                  onChanged: (value) {
                    setState(() {
                      carSpeed = value ? 120.0 : 60.0;
                    });
                  },
                  activeColor: Colors.transparent,
                ),
                // Switch(
                //     value: isSpeedHigh,
                //     onChanged: (value) {
                //       setState(() {
                //         isSpeedHigh = value;
                //         carSpeed = isSpeedHigh ? 120.0 : 60.0;
                //       });
                //     }),
                Text(
                  "2",
                  style: TextStyle(color: Colors.yellow, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 150),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(240)),
                  border: Border.all(color: speedColor = carSpeed >= 100.0 ? Colors.red : Colors.transparent, width: 20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 25,
                      offset: Offset(0, 3), // changes the position of the shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    children: [
                      Text(
                        carSpeed >= 100.0 ? "120" : "60",
                        style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "km/h",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Current Speed",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 148.9),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: speedColor = carSpeed >= 100.0 ? Colors.yellow : Colors.blue, width: 20),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
