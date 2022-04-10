import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final String route;
  final String title;
  final double height;
  final String subTitleLeft;
  final String subTitleRight;
  final Map raceData;

  const MainCard(
      {
        Key? key,
        required this.route,
        required this.title,
        required this.height,
        this.subTitleLeft = '',
        this.subTitleRight = '',
        this.raceData = const {}
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.red[900]),
          onPressed: () {
            Navigator.pushNamed(context, route);
          },
          child: Column(
            children: [
              SizedBox(
                  height: height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'Ubuntu',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            subTitleLeft,
                            style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                          Expanded(
                              child: Text(subTitleRight,
                              textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                              )))
                        ],
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}
