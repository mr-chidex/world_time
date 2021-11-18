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
    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text("Edit Location")),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data["location"],
                    style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(data["time"],
                  style: TextStyle(
                    fontSize: 65.0,
                    letterSpacing: 2.0,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}