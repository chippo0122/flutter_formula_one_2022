import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Race {
  var currentRace;
  var allCalender;
  var specificRace;

  Future getCurrentRace() async {
    Uri url = Uri.parse("http://ergast.com/api/f1/current/next.json");
    try {
      var response = await get(url);
      var data = jsonDecode(response.body);
      currentRace = data['MRData']['RaceTable']['Races'][0];
      print('SUCCESS');
    } catch (err) {
      print(err);
    }
  }

  Future getAllCalender() async {
    Uri url = Uri.parse('http://ergast.com/api/f1/current.json');
    try {
      var response = await get(url);
      var data = jsonDecode(response.body);
      allCalender = data['MRData']['RaceTable']['Races'];
      print('SUCCESS');
    } catch (err) {
      print(err);
    }
  }

  Future getSpecificRace(String round) async {
    Uri url = Uri.parse('http://ergast.com/api/f1/current/$round.json');
    try {
      var response = await get(url);
      var data = jsonDecode(response.body);
      specificRace = data['MRData']['RaceTable']['Races'][0];
      print('SUCCESS');
    } catch (err) {
      print(err);
    }
  }
}
