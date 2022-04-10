import 'package:flutter/material.dart';

class ShowCircuit extends StatelessWidget {
  String round = '';
  String name = '';
  String locality = '';
  String country = '';

  ShowCircuit(
      {Key? key,
      required this.round,
      required this.name,
      required this.locality,
      required this.country})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        round == '0'
            ? Text('')
            : Image.asset('assets/images/circuit/round_$round.png'),
        Text(
          name,
          style: TextStyle(
              color: Colors.grey[300], fontSize: 24, fontFamily: 'Ubuntu'),
        ),
        Text(
          '$locality, $country',
          style: TextStyle(color: Colors.grey),
        ),
        Divider(
          height: 10,
          color: Colors.grey,
        )
      ]),
    );
  }
}
