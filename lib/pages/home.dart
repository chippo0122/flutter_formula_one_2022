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

  void getInitData() async {
    await data.getCurrentRace();
    print('init');
    setState(() {
      currentRaceName = data.currentRace['raceName'];
      currentRaceDate = data.currentRace['date'];
      currentRaceLocality = data.currentRace['Circuit']['Location']['locality'];
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
                Expanded(
                    child: MainCard(
                      title: currentRaceName,
                      route: '/current',
                      height: 200.0,
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
                      height: 150,
                )),
                Expanded(
                    child: MainCard(
                      title: 'Standings',
                      route: '/Standing',
                      height: 150,
                ))
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: MainCard(
                    title: 'Race Result',
                    route: '/standing',
                    height: 200.0
                  )
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
