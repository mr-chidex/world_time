import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    //get data from loading route
    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;

    //set background
    bool isTime = data["isTime"];
    String bgImg = isTime ? 'day.jpg' : "night1.jpg";
    Color bgColor = isTime ? Colors.brown[300] : Colors.grey[700];
    Color txtColor = isTime ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/$bgImg"), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    dynamic res =
                        await Navigator.pushNamed(context, '/location');

                    setState(() {
                      data = {
                        "time": res["time"],
                        "isTime": res["isTime"],
                        "flag": res["flag"],
                        "location": res["location"],
                        "day": res["day"],
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text("Choose Location"),
                  style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      primary: bgColor,
                      textStyle: TextStyle(fontSize: 18)),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/${data['flag']}"),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      data["location"],
                      style: TextStyle(
                          fontSize: 30.0, letterSpacing: 2.0, color: txtColor),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(data["time"],
                    style: TextStyle(
                        fontSize: 65.0, letterSpacing: 2.0, color: txtColor)),
                SizedBox(height: 20),
                Text(data["day"],
                    style: TextStyle(
                        fontSize: 30.0, letterSpacing: 2.0, color: txtColor)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
