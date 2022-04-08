import 'package:http/http.dart';
import 'dart:convert';

class Race {

  var currentRace;

  Future getCurrentRace() async {
    Uri url = Uri.parse("http://ergast.com/api/f1/current/next.json");
    try {
      var response = await get(url);
      var data = jsonDecode(response.body);
      currentRace = data['MRData']['RaceTable']['Races'][0];
      print('SUCCESS');
    } catch (err) {
      currentRace = {
        'status': 'FAIL',
        'message': 'Get Request Failed'
      };
      print(err);
    }
  }
}