import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  //Initialize variables
  String location;  //location name for the UI
  String time;      //time for the location
  String flag;      //url to an asset flag icon
  String url;       //location url for api endpoint
  bool isDaytime;   //display image if day or night


  //Create constructor using named parameters

  WorldTime ({this.location, this.url, this.flag});

  Future <void> getTime () async {

    try {
      Response response = await get('https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      //Create a date property
      DateTime new_datetime = DateTime.parse(dateTime);
      new_datetime = new_datetime.add(Duration (hours: int.parse(offset)));


      //Check if it is night or day
      isDaytime = new_datetime.hour > 6 && new_datetime.hour < 19 ? true : false;
      //set time property
      time = DateFormat.jm().format(new_datetime);
    }
     catch (e) {
      print ('Caught error: $e');
      time = 'Could not load time';
     }
    //print(offset);
  }





}