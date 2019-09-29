import 'package:flutter/material.dart';
import 'package:i_can_fly_demo/pages/countrys_listing_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'I can Fly Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        canvasColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.white
        )
      ),
      home: CountrysListingScreen(),
    );
  }
}
