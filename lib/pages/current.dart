import 'package:flutter/material.dart';
//service
import 'package:flutter_formula_one_2022/service/race.dart';

class Current extends StatefulWidget {
  const Current({Key? key}) : super(key: key);

  @override
  State<Current> createState() => _CurrentState();
}

class _CurrentState extends State<Current> {
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
    print('init current');
    getInitData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.red[900],
          title: Text(
            'Current',
            style: TextStyle(
                fontFamily: 'Ubuntu', color: Colors.white, fontSize: 24),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Text(
                    currentRaceName,
                    style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                        fontSize: 56,
                        color: Colors.white),
                  ))
                ],
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    '$currentRaceDate, $currentRaceLocality',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.grey[300]),
                  ))
                ],
              ),
              Divider(
                height: 15,
                color: Colors.grey[500],
              )
            ],
          ),
        ));
  }
}
