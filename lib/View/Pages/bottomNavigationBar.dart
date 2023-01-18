import 'package:flutter/material.dart';
import 'package:weather/Model/weatherModel.dart';
import 'package:weather/View/Pages/forecast.dart';
import 'package:weather/View/Pages/home.dart';
import 'package:weather/View/Pages/search.dart';
import 'package:weather/View/Pages/setting.dart';

class NavBar extends StatefulWidget {
  List<WeatherModel> weatherModel = [];

  NavBar({required this.weatherModel});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  late List<Widget> pages;

  @override
  void initState() {
    pages = [
      Home(weatherModel: widget.weatherModel),
      Search(weatherModel: widget.weatherModel),
      Forecast(weatherModel: widget.weatherModel),
      Setting(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff060720),
        body: pages.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color(0xff060720),
            currentIndex: _currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/1.2.png',
                  height: myHeight * 0.03,
                  color: Colors.grey.withOpacity(0.5),
                ),
                label: '',
                activeIcon: Image.asset(
                  'assets/icons/1.1.png',
                  height: myHeight * 0.03,
                  color: Colors.white,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/2.2.png',
                  height: myHeight * 0.03,
                  color: Colors.grey.withOpacity(0.5),
                ),
                label: '',
                activeIcon: Image.asset(
                  'assets/icons/2.1.png',
                  height: myHeight * 0.03,
                  color: Colors.white,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/3.2.png',
                  height: myHeight * 0.03,
                  color: Colors.grey.withOpacity(0.5),
                ),
                label: '',
                activeIcon: Image.asset(
                  'assets/icons/3.1.png',
                  height: myHeight * 0.03,
                  color: Colors.white,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/4.2.png',
                  height: myHeight * 0.03,
                  color: Colors.grey.withOpacity(0.5),
                ),
                label: '',
                activeIcon: Image.asset(
                  'assets/icons/4.1.png',
                  height: myHeight * 0.03,
                  color: Colors.white,
                ),
              ),
            ]),
      ),
    );
  }
}
