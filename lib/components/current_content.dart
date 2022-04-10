import 'package:flutter/material.dart';

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