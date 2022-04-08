import 'package:flutter/material.dart';

class Standing extends StatefulWidget {
  const Standing({ Key? key }) : super(key: key);

  @override
  State<Standing> createState() => _StandingState();
}

class _StandingState extends State<Standing> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('this is standing')
    );
  }
}