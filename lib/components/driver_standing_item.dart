import 'package:flutter/material.dart';
import 'package:flutter_formula_one_2022/color_team_map.dart';

class DriverStandingItem extends StatelessWidget {
  String name;
  String pos;
  String point;
  String team;
  String num;

  DriverStandingItem({
    Key? key,
    required this.name,
    required this.pos,
    required this.point,
    required this.team,
    required this.num,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                              color: colorTeamMap[team], width: 10))),
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
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '$team - $num',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Ubuntu',
                          color: Colors.grey[300]),
                    )
                  ],
                )),
            Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Point',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Ubuntu',
                          fontSize: 20),
                    ),
                    Text(
                      point,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Ubuntu',
                          fontSize: 48),
                    )
                  ],
                ))
          ],
        ),
        Divider(
          height: 15,
          thickness: 1,
          color: Colors.grey[700],
        )
      ],
    );
  }
}