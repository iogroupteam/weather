import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/Model/weatherModel.dart';
import 'package:weather/View/Pages/bottomNavigationBar.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await loadJson();
    });
    super.initState();
  }

  List data = [];
  List<WeatherModel> weatherList = [];

  loadJson() async {
    String myData = await rootBundle.loadString('assets/myJson/file.json');

    setState(() {
      data = json.decode(myData);
      weatherList = data.map((e) => WeatherModel.fromJson(e)).toList();
      weatherList = weatherList;
    });
    Timer(
        Duration(seconds: 2),
        (() => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: ((context) => NavBar(
                      weatherModel: weatherList,
                    ))))));
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff060720),
        body: Container(
          height: myHeight,
          width: myWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(''),
              Text(
                'Weather',
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Creat by',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        width: myWidth * 0.02,
                      ),
                      Image.asset(
                        'assets/io.png',
                        height: myHeight * 0.03,
                      )
                    ],
                  ),
                  SizedBox(
                    height: myHeight * 0.009,
                  ),
                  Image.asset(
                    'assets/loading1.gif',
                    height: myHeight * 0.015,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: myHeight * 0.02,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
