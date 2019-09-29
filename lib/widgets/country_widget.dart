import 'package:flutter/material.dart';
import 'package:i_can_fly_demo/models/countrys.dart';
import 'package:i_can_fly_demo/pages/countrys_details_screen.dart';
import 'package:i_can_fly_demo/styleguide.dart';

class CountryWidget extends StatelessWidget {
  final Countrys country;
  final PageController pageController;
  final int currentPage;

  const CountryWidget(
      {Key key, this.country, this.pageController, this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 350),
                pageBuilder: (context, _, __) =>
                    CountryDetailScreen(country: country)));
      },
      child: AnimatedBuilder(
        animation: pageController,
        builder: (context, child) {
          double value = 1;
          if (pageController.position.haveDimensions) {
            value = pageController.page - currentPage;
            value = (1 - (value.abs() * 0.6)).clamp(0.0, 1.0);
          }
          return Stack(children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: CountryCardBackgroundClip(),
                child: Hero(
                  tag: "background-${country.name}",
                  child: Container(
                    //padding: const EdgeInsets.symmetric(horizontal: screenWidth * 0.5  ),
                    height: 0.6 * screenHeight,
                    width: 0.9 * screenWidth,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: country.colors,
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft)),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -0.5),
              child: Hero(
                tag: "image-${country.name}",
                child: Image.asset(
                  country.imagePath,
                  height: screenHeight * 0.50 * value,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48, right: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Hero(
                      tag: "name-${country.name}",
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                            child: Text(country.name, style: AppTheme.heading)),
                      )),
                  Text(
                    "Toque para ler mais",
                    style: AppTheme.subHeading,
                  ),
                ],
              ),
            )
          ]);
        },
      ),
    );
  }
}

class CountryCardBackgroundClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    double curveDistance = 40;

    clippedPath.moveTo(0, size.height * 0.4);
    clippedPath.lineTo(0, size.height - curveDistance);
    clippedPath.quadraticBezierTo(
        1, size.height - 1, 0 + curveDistance, size.height);
    clippedPath.lineTo(size.width - curveDistance, size.height);
    clippedPath.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    clippedPath.lineTo(size.width, 0 + curveDistance);
    clippedPath.quadraticBezierTo(size.width - 1, 0,
        size.width - curveDistance - 5, 0 + curveDistance / 3);
    clippedPath.lineTo(curveDistance, size.height * 0.29);
    clippedPath.quadraticBezierTo(
        1, (size.height * 0.30) + 10, 0, size.height * 0.4);
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
