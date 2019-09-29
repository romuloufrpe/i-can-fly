import 'package:flutter/material.dart';
import 'package:i_can_fly_demo/models/countrys.dart';
import 'package:i_can_fly_demo/styleguide.dart';
import 'package:i_can_fly_demo/widgets/country_widget.dart';

class CountrysListingScreen extends StatefulWidget {
  CountrysListingScreen({Key key}) : super(key: key);

  _CountrysListingScreenState createState() => _CountrysListingScreenState();
}

class _CountrysListingScreenState extends State<CountrysListingScreen> {
  PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
        viewportFraction: 1.0, initialPage: currentPage, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Icon(Icons.menu),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(Icons.search),
            )
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 32.0, top: 8.0),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(text: "Bem Vindo!!", style: AppTheme.display1),
                      TextSpan(text: "\n"),
                      TextSpan(
                          text: "Vamos viajar?",
                          style: AppTheme.display2)
                    ]),
                  ),
                ),
                Expanded(
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    children: <Widget>[
                      for (var i = 0; i < countrys.length; i++)
                        CountryWidget(country: countrys[i], pageController: _pageController, currentPage: i)
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
