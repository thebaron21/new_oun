import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageLogo extends StatelessWidget {
  const PageLogo({
    Key key,
    @required this.imagePath,
    this.height,
  }) : super(key: key);
  final String imagePath;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: SvgPicture.asset(
        imagePath,
        height: height,
      ),
    );
  }
}
