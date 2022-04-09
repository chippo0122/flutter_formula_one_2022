import 'package:http/http.dart';
import 'dart:convert';


class Rank {
  var driverStanding;
  var constructorStanding;

  Future getDriverStanding() async {
    Uri url = Uri.parse('https://ergast.com/api/f1/current/driverStandings.json');
    try {
      var response = await get(url);
      var data = jsonDecode(response.body);
      driverStanding = data['MRData']['StandingsTable']['StandingsLists'][0]['DriverStandings'];
    } catch (error) {
      print(error);
    }
  }

    Future getConstructorStanding() async {
    Uri url = Uri.parse('https://ergast.com/api/f1/current/constructorStandings.json');
    try {
      var response = await get(url);
      var data = jsonDecode(response.body);
      constructorStanding = data['MRData']['StandingsTable']['StandingsLists'][0]['ConstructorStandings'];
    } catch (error) {
      print(error);
    }
  }
}