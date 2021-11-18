import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "loading...";

  void getWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Lagos', flag: "nigeria.png", url: "/Africa/Lagos");

    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isTime": instance.isTime,
      "day": instance.day,
    });
  }

  void initState() {
    super.initState();
    getWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
          child: Center(
              child: SpinKitFadingCube(
        color: Colors.white,
        size: 50.0,
      ))),
    );
  }
}
