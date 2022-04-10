import 'package:flutter/material.dart';
//service
import 'package:flutter_formula_one_2022/service/last_result.dart';
//components
import 'package:flutter_formula_one_2022/components/result_list_item.dart';

class RaceResult extends StatefulWidget {
  const RaceResult({Key? key}) : super(key: key);

  @override
  State<RaceResult> createState() => _RaceResultState();
}

class _RaceResultState extends State<RaceResult> {
  var data = LastResult();
  var lastResult;
  String raceName = '';
  String raceCircuitName = '';
  String raceRound = '0';
  String raceLocation = '';
  String raceDate = '';
  var resultList;

  void getInitData() async {
    await data.getLastResult();
    setState(() {
      lastResult = data.lastResult;

      String locality = lastResult['Circuit']['Location']['locality'];
      String country = lastResult['Circuit']['Location']['country'];

      raceName = lastResult['raceName'];
      raceCircuitName = lastResult['Circuit']['circuitName'];
      raceLocation = '$locality, $country';
      raceRound = lastResult['round'];
      raceDate = lastResult['date'];
      resultList = lastResult['Results'];
    });
  }

  void initState() {
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
          'Last Race Result',
          style: TextStyle(
              fontFamily: 'Ubuntu', color: Colors.white, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            raceRound == '0'
                ? Text('Loading...',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Ubuntu',
                  fontSize: 24
                ))
                : Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            raceName,
                            style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Image.asset(
                                    'assets/images/circuit/round_$raceRound.png'),
                              ),
                              Expanded(
                                flex: 6,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Round $raceRound',
                                      style: TextStyle(
                                          fontFamily: 'Ubuntu',
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      'Date: $raceDate',
                                      style: TextStyle(
                                          fontFamily: 'Ubuntu',
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      raceCircuitName,
                                      style: TextStyle(
                                          fontFamily: 'Ubuntu',
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      raceLocation,
                                      style: TextStyle(
                                          fontFamily: 'Ubuntu',
                                          color: Colors.white,
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ]),
                  ),
            Divider(
              height: 15,
              thickness: 1,
              color: Colors.grey[700],
            ),
            Column(
              children: resultList?.map<Widget>((item) {
                    return ResultListItrem(
                        code: item['Driver']['code'],
                        team: item['Constructor']['name'],
                        num: item['Driver']['permanentNumber'],
                        time: item['Time'] == null
                            ? 'Unfinished'
                            : item['Time']['time'],
                        pos: item['positionText'],
                        fastestLap: item['FastestLap'] == null
                            ? ''
                            : item['FastestLap']['Time']['time'],
                        fastestAt: item['FastestLap'] == null
                            ? 'No Data'
                            : item['FastestLap']['lap'],
                        gridPos: item['grid']);
                  }).toList() ??
                  [],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                      child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style:
                        TextButton.styleFrom(backgroundColor: Colors.red[900]),
                    child: Text(
                      'Back to Home',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Ubuntu',
                          fontSize: 24),
                    ),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
