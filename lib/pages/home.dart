import 'package:flutter/material.dart';
import 'dart:convert';
//component
import 'package:flutter_formula_one_2022/components/main_card.dart';
//service
import 'package:flutter_formula_one_2022/service/race.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Race data = Race();
  var currentRaceName = 'Loading...';
  var currentRaceDate = '';
  var currentRaceLocality = '';
  var lastRace = '';

  void getInitData() async {
    await data.getCurrentRace();
    await data.getLastRace();
    print('init');
    setState(() {
      currentRaceName = data.currentRace['raceName'];
      currentRaceDate = data.currentRace['date'];
      currentRaceLocality = data.currentRace['Circuit']['Location']['locality'];
      lastRace = data.lastRace;
    });
  }

  void initState() {
    getInitData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Row(
              children: [
                Expanded(flex: 3,child: Image.asset('assets/images/logo.png')),
                SizedBox(width: 10),
                Expanded(
                  flex: 7,
                    child: Text(
                  '2022 Schedule',
                  style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 42,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ))
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                    child: MainCard(
                  title: currentRaceName,
                  route: '/current',
                  height: 180.0,
                  subTitleLeft: currentRaceDate,
                  subTitleRight: currentRaceLocality,
                ))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: MainCard(
                  title: 'Calender',
                  route: '/calender',
                  height: 120,
                )),
                Expanded(
                    child: MainCard(
                  title: 'Standings',
                  route: '/standing',
                  height: 120,
                ))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: MainCard(
                        title: 'Last Race Result',
                        subTitleLeft: lastRace,
                        route: '/result',
                        height: 180.0)),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
