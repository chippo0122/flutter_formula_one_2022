import 'package:flutter/material.dart';
//service
import 'package:flutter_formula_one_2022/service/race.dart';

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  Race data = Race();
  var allCalender;

  void initCalenderData() async {
    await data.getAllCalender();
    setState(() {
      allCalender = data.allCalender;
    });
  }

  void initState() {
    initCalenderData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          elevation: 0,
          title: Text(
            'Calender',
            style: TextStyle(
                fontFamily: 'Ubuntu', color: Colors.white, fontSize: 24),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: allCalender?.map<Widget>((item) {
                      return CalenderListItem(
                          raceName: item['raceName'],
                          raceDate: item['date'],
                          raceRound: item['round'],
                          locality: item['Circuit']['Location']['locality'],
                          country: item['Circuit']['Location']['country']);
                    })?.toList() ??
                    [
                      Center(child: Text('Loading...', style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Ubuntu')))
                    ],
              )),
        ));
  }
}

class CalenderListItem extends StatelessWidget {
  String raceName;
  String raceDate;
  String raceRound;
  String locality;
  String country;

  CalenderListItem(
      {Key? key,
      required this.raceName,
      required this.raceDate,
      required this.raceRound,
      required this.locality,
      required this.country})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/prix', arguments: {
            'raceRound': raceRound,
            'raceName': raceName
          });
        },
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Round $raceRound',
                      style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 16,
                          color: Colors.grey),
                    ),
                    Text(
                      raceName,
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    raceDate,
                    style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '$locality, $country',
                    style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 18,
                        color: Colors.white),
                  )
                ],
              ))
            ]),
            Divider(height: 25, color: Colors.grey, thickness: 2)
          ],
        ));
  }
}
