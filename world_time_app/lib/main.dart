import 'package:flutter/material.dart';
import 'package:world_time_app/pages/loading.dart';
import 'package:world_time_app/pages/location.dart';
import 'pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context) => Loading (),
      '/home' : (context) => Home(),
      '/location' : (context) => ChooseLocaton(),
    },

    debugShowCheckedModeBanner: false,
  ));

}

