import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class LastResult {

  var lastResult;

  Future getLastResult() async {
    Uri url = Uri.parse("http://ergast.com/api/f1/current/last/results.json");
    try {
      var response = await get(url);
      var data = jsonDecode(response.body);
      lastResult = data['MRData']['RaceTable']['Races'][0];
      print('SUCCESS');
    } catch (err) {
      print(err);
    }
  }
}