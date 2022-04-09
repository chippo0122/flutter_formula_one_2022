import 'package:flutter/material.dart';
//service
import 'package:flutter_formula_one_2022/service/rank.dart';
//components
import 'package:flutter_formula_one_2022/components/team_standing_item.dart';
import 'package:flutter_formula_one_2022/components/driver_standing_item.dart';

class Standing extends StatefulWidget {
  const Standing({Key? key}) : super(key: key);

  @override
  State<Standing> createState() => _StandingState();
}

class _StandingState extends State<Standing> {
  Rank data = Rank();
  var constructorStanding;
  var driverStanding;
  var currentStatus = 'driver';

  void getInitData() async {
    await data.getDriverStanding();
    await data.getConstructorStanding();
    setState(() {
      constructorStanding = data.constructorStanding;
      driverStanding = data.driverStanding;
    });
  }

  void initState() {
    print('init standing page');
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
          'Standings',
          style: TextStyle(
              fontFamily: 'Ubuntu', color: Colors.white, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(
                currentStatus == 'driver'
                    ? 'Driver Standings'
                    : 'Team Standings',
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 52,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ]),
          ),
          Divider(height: 15),
          currentStatus == 'driver'
              ? Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 10, 70),
                  child: Column(
                      children: driverStanding?.map<Widget>((item) {
                            var givenName = item['Driver']['givenName'];
                            var familynName = item['Driver']['familyName'];
                            return DriverStandingItem(
                                name: '$givenName $familynName',
                                pos: item['positionText'],
                                point: item['points'],
                                team: item['Constructors'][0]['name'],
                                num: item['Driver']['permanentNumber']);
                          }).toList() ??
                          [
                            Center(
                              child: Text(
                                'Loading...',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: 'Ubuntu'),
                              ),
                            )
                          ]),
                )
              : Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 10, 70),
                  child: Column(
                      children: constructorStanding?.map<Widget>((item) {
                            return TeamStandingItem(
                              pos: item['positionText'],
                              point: item['points'],
                              team: item['Constructor']['name'],
                            );
                          }).toList() ??
                          [
                            Center(
                              child: Text(
                                'Loading...',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: 'Ubuntu'),
                              ),
                            )
                          ]),
                ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (currentStatus == 'driver') {
              currentStatus = 'team';
            } else {
              currentStatus = 'driver';
            }
          });
        },
        backgroundColor: Colors.red[900],
        child: Icon(Icons.compare_arrows),
        tooltip: 'Switch',
      ),
    );
  }
}
