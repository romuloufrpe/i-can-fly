import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:i_can_fly_demo/models/countrys.dart';
import 'package:i_can_fly_demo/styleguide.dart';

class CountryDetailScreen extends StatefulWidget {
  final Countrys country;

  final double _exprandedBottomSheetBottomPosition = 0;
  final double _collpsedBottomSheetBottomPosition = -250;
  final double _completeCollpsedBottomSheetBottomPosition = -330;

  const CountryDetailScreen({Key key, this.country}) : super(key: key);
  @override
  _CountryDetailScreenState createState() => _CountryDetailScreenState();
}

class _CountryDetailScreenState extends State<CountryDetailScreen>
    with AfterLayoutMixin<CountryDetailScreen> {
  double _bottomSheetBottomPosition = -330;
  bool isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: "background-${widget.country.name}",
            child: DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: widget.country.colors,
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft)),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 16),
                  child: IconButton(
                    icon: Icon(Icons.close),
                    iconSize: 40,
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {
                      Future.delayed(const Duration(milliseconds: 250), () {
                        setState(() {
                          _bottomSheetBottomPosition =
                              widget._completeCollpsedBottomSheetBottomPosition;
                        });
                        Navigator.pop(context);
                      });
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                    tag: "image-${widget.country.name}",
                    child: Image.asset(
                      widget.country.imagePath,
                      height: screenHeight * 0.45,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
                  child: Hero(
                      tag: "name-${widget.country.name}",
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                            child: Text(widget.country.name,
                                style: AppTheme.heading)),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 8, 32),
                  child: Text(
                    widget.country.description,
                    style: AppTheme.subHeading,
                  ),
                )
              ],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.decelerate,
            bottom: _bottomSheetBottomPosition,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: _onTap,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      height: 80,
                      child: Text(
                        "Mais",
                        style:
                            AppTheme.subHeading.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: _clipsWidget(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isCollapsed = true;
        _bottomSheetBottomPosition = widget._collpsedBottomSheetBottomPosition;
      });
    });
  }

  _onTap() {
    setState(() {
      _bottomSheetBottomPosition = isCollapsed
          ? widget._exprandedBottomSheetBottomPosition
          : widget._collpsedBottomSheetBottomPosition;

      isCollapsed = !isCollapsed;
    });
  }
}

Widget _clipsWidget() {
  //final double bottom = 0;
  final double top = 250;
  return Container(
    height: top,
    margin: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: <Widget>[
        Column(
          children: <Widget>[
/********************IMAGE ADD */
            Text(
              "Presidente\nJair Bolsonaro",
              style: AppTheme.subHeading
                  .copyWith(color: Colors.black, fontSize: 15),
            ),
            //rounderImage('assents/images/president.png'),
            //roundedContainer(Colors.redAccent),
            SizedBox(
              height: 20,
            ),
            
            Text(
              "Salário Minimo\nR\$\998,00",
              style: AppTheme.subHeading
                  .copyWith(color: Colors.black, fontSize: 15),
            ),
            //rounderImage('assents/images/capital-brasil.png'),
            // roundedContainer(Colors.greenAccent)
          ],
        ),
        SizedBox(width: 40),
        Column(
          children: <Widget>[
            
            Text(
              "Capital\nBrasilia",
              style: AppTheme.subHeading
                  .copyWith(color: Colors.black, fontSize: 15),
            ),
            //rounderImage('assents/images/population.png'),
            //roundedContainer(Colors.orangeAccent),
            SizedBox(
              height: 20,
            ),
            Text(
              "Imigrantes\n750.000,00",
              style: AppTheme.subHeading
                  .copyWith(color: Colors.black, fontSize: 15),
            ),
            //rounderImage('assents/images/imigrant.png')
            //roundedContainer(Colors.purple)
          ],
        ),
        SizedBox(width: 40),
        Column(
          children: <Widget>[
            Text(
              "População\n202.768.562",
              style: AppTheme.subHeading
                  .copyWith(color: Colors.black, fontSize: 15),
            ),
            //rounderImage('assents/images/cash.jpg'),
            //roundedContainer(Colors.grey),
            SizedBox(
              height: 20,
            ),
            Text(
              "Documentação\nimigração",
              style: AppTheme.subHeading
                  .copyWith(color: Colors.black, fontSize: 15),
            ),
            //rounderImage('assents/images/documents.png')
            //roundedContainer(Colors.blueGrey)
          ],
        ),
      ],
    ),
  );
}

Widget roundedContainer(Color color) {
  return Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
        color: color, borderRadius: BorderRadius.all(Radius.circular(20))),
  );
}

Widget rounderImage(String image) {
  return Container(
    height: 100,
    width: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      image: DecorationImage(image: ExactAssetImage(image)),
    ),
  );
}
