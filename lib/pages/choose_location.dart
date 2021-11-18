import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: "Berlin", url: "Europe/Berlin", flag: "germany.png"),
    WorldTime(location: "Athens", url: "Europe/Athens", flag: "greece.png"),
    WorldTime(location: "Lagos", url: "Africa/Lagos", flag: "nigeria.png"),
    WorldTime(location: "Accra", url: "Africa/Accra", flag: "ghana.png"),
    WorldTime(location: "Seoul", url: "Asia/Seoul", flag: "south_korea.jpg"),
    WorldTime(location: "Chicago", url: "America/Chicago", flag: "usa.png"),
    WorldTime(location: "New York", url: "America/New_York", flag: "usa.png"),
    WorldTime(location: "London", url: "Europe/London", flag: "uk.png"),
  ];

  void getNewTime(instance) async {
    await instance.getTime();

    Navigator.pushNamed(context, '/home', arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isTime": instance.isTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Choose a location"),
          backgroundColor: Colors.blue[900],
          elevation: 0,
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 4.0),
                  child: ListTile(
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/${locations[index].flag}"),
                    ),
                    onTap: () {
                      getNewTime(locations[index]);
                    },
                  ),
                ),
              );
            }));
  }
}
