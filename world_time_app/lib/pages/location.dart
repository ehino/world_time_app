import 'package:flutter/material.dart';
import 'package:world_time_app/services/word_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChooseLocaton extends StatefulWidget {


  @override
  _LocatonState createState() => _LocatonState();
}

class _LocatonState extends State<ChooseLocaton> {
  @override
  Widget build(BuildContext context) {

    List <WorldTime> locations = [
      WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
      WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
      WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
      WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
      WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
      WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
      WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
      WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    ];

    void updateTime (index) async {
      WorldTime worldTime = locations[index];
      await worldTime.getTime();
      Navigator.pop(context, {
        'location': worldTime.location,
        'time':worldTime.time,
        'flag':worldTime.flag,
        'isDaytime':worldTime.isDaytime,
      });
    }

    SpinKitPouringHourglass spinKitPouringHourglass;


    return Scaffold(
      appBar: AppBar(
        title: Text ("Choose Location"),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(6.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  //Reroute to Loading Screen before Location show
                  
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
