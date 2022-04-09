import 'package:flutter/material.dart';

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
          Navigator.pushNamed(context, '/prix',
              arguments: {'raceRound': raceRound, 'raceName': raceName});
        },
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                flex: 7,
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
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '$raceDate $locality, $country',
                      style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 18,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                  flex: 3,
                  child: Image.asset('assets/images/circuit/round_$raceRound.png')
              )
            ]),
            Divider(height: 25, color: Colors.grey, thickness: 2)
          ],
        ));
  }
}
