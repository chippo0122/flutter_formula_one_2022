import 'package:flutter/material.dart';
//component
import 'package:flutter_formula_one_2022/components/show_circuit.dart';
//service
import 'package:flutter_formula_one_2022/service/race.dart';

class Prix extends StatefulWidget {
  const Prix({Key? key}) : super(key: key);

  @override
  State<Prix> createState() => _PrixState();
}

class _PrixState extends State<Prix> {
  Race data = Race();
  String currentRound = '0';
  var currentRaceName = 'Loading...';
  var currentRaceDate = '';
  var currentRaceLocality = '';
  var currentRaceCountry = '';
  var circuitName = '';
  //race time
  var firstPrac = '';
  var firstPracDate = '';
  var secondPrac = '';
  var secondPracDate = '';
  var thirdPrac = '';
  var thirdPracDate = '';
  var qualify = '';
  var qualifyDate = '';
  var mainRace = '';
  var mainRaceDate = '';
  var sprint = '';
  var sprintDate = '';

  var getName = '';
  var getRound = '';

  void getInitData() async {
    await data.getSpecificRace(getRound);
    print('init');
    setState(() {
      currentRound = data.specificRace['round'];
      currentRaceName = data.specificRace['raceName'];
      currentRaceDate = data.specificRace['date'];
      currentRaceLocality =
          data.specificRace['Circuit']['Location']['locality'];
      currentRaceCountry = data.specificRace['Circuit']['Location']['country'];
      circuitName = data.specificRace['Circuit']['circuitName'];
      //race date
      firstPrac = data.specificRace['FirstPractice']['time'];
      firstPracDate = data.specificRace['FirstPractice']['date'];
      secondPrac = data.specificRace['SecondPractice']['time'];
      secondPracDate = data.specificRace['SecondPractice']['date'];

      if (data.specificRace['ThirdPractice'] != null) {
        thirdPrac = data.specificRace['ThirdPractice']['time'];
        thirdPracDate = data.specificRace['ThirdPractice']['date'];
      }

      if (data.specificRace['Sprint'] != null) {
        sprint = data.specificRace['Sprint']['time'];
        sprintDate = data.specificRace['Sprint']['date'];
      }

      qualify = data.specificRace['Qualifying']['time'];
      qualifyDate = data.specificRace['Qualifying']['date'];
      mainRace = data.specificRace['time'];
      mainRaceDate = data.specificRace['date'];
    });
  }

  void initState() {
    print('init current');
    Future.delayed(Duration.zero, () {
      setState(() {
        var routeData = ModalRoute.of(context)!.settings.arguments;
        if (routeData != null) {
          print(routeData);
          print((routeData as Map)['raceRound']);
          getRound = (routeData as Map)['raceRound'];
          getName = (routeData as Map)['raceName'];
          getInitData();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.red[900],
          title: Text(
            getName,
            style: TextStyle(
                fontFamily: 'Ubuntu', color: Colors.white, fontSize: 24),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/calender/round_$currentRound.jpg'),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
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
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
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
              ),
              Divider(
                height: 15,
                color: Colors.grey[500],
              ),
              ShowCircuit(
                  round: currentRound,
                  name: circuitName,
                  locality: currentRaceLocality,
                  country: currentRaceCountry),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    CurrentContent(
                      time: firstPrac,
                      date: firstPracDate,
                      event: 'First Practice',
                    ),
                    CurrentContent(
                      time: secondPrac,
                      date: secondPracDate,
                      event: 'Second Practice',
                    ),
                    sprint == ''
                        ? CurrentContent(
                            time: thirdPrac,
                            date: thirdPracDate,
                            event: 'Third Practice',
                          )
                        : CurrentContent(
                            time: sprint,
                            date: sprintDate,
                            event: 'Sprint Qualify',
                          ),
                    CurrentContent(
                      time: qualify,
                      date: qualifyDate,
                      event: 'Qualify',
                    ),
                    CurrentContent(
                      time: mainRace,
                      date: mainRaceDate,
                      event: 'Main Race',
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/calender');
                      },
                      child: Text(
                        'Back to Calender',
                        style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 24,
                            color: Colors.grey[300]),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red[900],
                      ),
                    ),
                  ))
                ],
              ),
              SizedBox(height: 15)
            ],
          ),
        ));
  }
}

class CurrentContent extends StatelessWidget {
  String time;
  String date;
  String event;

  CurrentContent(
      {Key? key, required this.time, required this.date, required this.event})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Icon(
                  Icons.flag,
                  color: Colors.white,
                ),
                SizedBox(width: 15),
                Text(
                  event,
                  style: TextStyle(
                      color: Colors.grey[300],
                      fontFamily: 'Ubuntu',
                      fontSize: 24),
                )
              ],
            ),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 18,
                    fontFamily: 'Ubuntu'),
              ),
              Text(
                time,
                style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 24,
                    fontFamily: 'Ubuntu'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
