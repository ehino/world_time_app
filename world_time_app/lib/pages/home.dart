import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    //Ternary operators
    String bgImg = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration (
            image: DecorationImage (
              image: AssetImage('assets/$bgImg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding:  EdgeInsets.fromLTRB(0, 120, 0, 0),

            child: Column(
              children: [
                FlatButton.icon (
                  onPressed: () async {
                     dynamic result = await Navigator.pushNamed(context, '/location');
                     setState(() {
                       data = {
                         'time': result ['time'],
                         'location': result['location'],
                         'isDaytime' : result ['isDaytime'],
                         'flag' : result ['flag'],
                       };
                     });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.white,
                    size: 20,
                  ),
                  label: Text(
                      'Location',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height:20.0),

                Row (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                   Text(
                       data['location'],
                     style: TextStyle(
                       fontSize: 30,
                       color: Colors.white,
                     ),
                   ),

                  ],
                ),
                SizedBox(height: 15),
                Text (
                  data['time'],
                  style: TextStyle(
                    fontSize: 55,
                    color: Colors.white,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
