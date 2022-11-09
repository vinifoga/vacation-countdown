import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:limas_vacation_back_countdown/components/display_component.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Férias da Lays',
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(title: 'Férias Lays'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _date = DateTime(2022, 12, 30, 18, 0, 0, 0, 0);
  var _currDate = DateTime.now();
  int days = 0;
  int hours = 0;
  int minutes = 0;
  int seconds = 0;


  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        _currDate = DateTime.now();
        days = (_date.difference(_currDate)).inDays;
        hours = ((_date.difference(_currDate)).inHours) - days*24;
        minutes = (_date.difference(_currDate)).inMinutes - (hours*60) - (days*1440) ;
        seconds = (_date.difference(_currDate)).inSeconds - (minutes*60) - (hours*3600) - (days*86400);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    'Faltam',
                    style: GoogleFonts.robotoMono(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DisplayComponent(variable: days.toString(), text: 'Dias',),
                  DisplayComponent(variable: hours.toString(), text: 'Horas',),
                  DisplayComponent(variable: minutes.toString(), text: 'Minutos',),
                  DisplayComponent(variable: seconds.toString(), text: 'Segundos',),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Para as férias da Lays',
                  style: GoogleFonts.robotoMono(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
