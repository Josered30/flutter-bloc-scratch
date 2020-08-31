import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern_scratch/route_generator.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {  
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouterGenerator.generateRoute,
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.grey[900],
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonColor: Colors.black
      ),
    );
  }
}


