import 'package:flutter/material.dart';
import 'package:world_time_app/services/word_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  //Creating an instance
  void showWorldTime() async {
    WorldTime worldTime = new WorldTime(location: 'London', url: 'Europe/London', flag: 'london.png');
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location':worldTime.location,
      'time':worldTime.time,
      'flag':worldTime.flag,
      'isDaytime':worldTime.isDaytime,
    });


  }


  @override
  void initState() {

    super.initState();
    showWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
        backgroundColor: Colors.blue,
      ),
      body: Center (
        child: SpinKitPouringHourglass(
          color: Colors.blue,
          size: 50.0,
        ),

      ),
    );
  }
}
