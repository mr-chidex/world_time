import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String url; //location url for api endpoint
  String location; //location name for the UI
  String time; // time of location
  String flag; //url to an asset flag
  bool isTime; //check if day time or night

  WorldTime({this.url, this.location, this.flag});

  Future<void> getTime() async {
    try {
      //make request
      Response response = await get(
          Uri.parse('http://worldtimeapi.org/api/timezone/${this.url}'));
      Map data = jsonDecode(response.body);

      String dateTime = data["datetime"];
      String offset = data["utc_offset"].substring(1, 3);

      //create date object
      DateTime now = DateTime.parse(dateTime);
      now.add(Duration(hours: int.parse(offset)));

      this.isTime = now.hour > 6 && now.hour < 20 ? true : false;
      this.time = DateFormat.jm().format(now);
    } catch (error) {
      this.time = "could not get time data";
    }
  }
}
