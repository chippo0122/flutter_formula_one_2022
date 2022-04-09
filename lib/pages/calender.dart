import 'package:flutter/material.dart';
//service
import 'package:flutter_formula_one_2022/service/race.dart';
//components
import 'package:flutter_formula_one_2022/components/calender_list_item.dart';

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
