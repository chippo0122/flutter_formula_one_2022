import 'package:flutter/material.dart';
import 'package:flutter_formula_one_2022/color_team_map.dart';

class ResultListItrem extends StatelessWidget {
  String code;
  String team;
  String num;
  String time;
  String pos;
  String fastestLap;
  String fastestAt;
  String gridPos;

  ResultListItrem(
      {Key? key,
      required this.code,
      required this.team,
      required this.num,
      required this.time,
      required this.pos,
      required this.fastestAt,
      required this.fastestLap,
      required this.gridPos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 15, 20, 15),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                decoration: BoxDecoration(
                    border: Border(
                        left:
                            BorderSide(color: colorTeamMap[team], width: 10))),
                child: Text(
                  pos,
                  style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: Colors.grey[300]),
                ),
              )),
          Expanded(
              flex: 3,
              child: Text(
                code,
                style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              )),
          Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Fastest Lap',
                    style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 16,
                        color: Colors.white),
                  ),
                  Text(
                    '$fastestLap ${fastestAt == "No Data" ? 'No Data' : '($fastestAt)'}',
                    style: TextStyle(
                        fontFamily: 'Ubuntu',
                        color: Colors.white,
                        fontSize: 22),
                  )
                ],
              )),
          Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Time',
                    style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 16,
                        color: Colors.white),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                        fontFamily: 'Ubuntu',
                        color: Colors.white,
                        fontSize: 22),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
