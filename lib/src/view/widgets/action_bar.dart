import 'package:flutter/material.dart';
import '../../helpers/color_pattern.dart';
import '../../view/widgets/home.dart';

class ActionBar extends StatelessWidget {
  const ActionBar({
    Key key,
    @required this.colorPattern,
    @required this.title,
    @required this.back,
    @required this.help,
  }) : super(key: key);

  final ColorPattern colorPattern;
  final String title;
  final Function back;
  final Function help;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: colorPattern.grayColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: GestureDetector(
              onTap: back,
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios),
                  Text('رجوع'),
                ],
              ),
            ),
          ),
          Text(title),
          Container(
            child: GestureDetector(
              onTap: () {
                help();
              },
              child: Row(
                children: [
                  Text('مساعدة'),
                  Icon(Icons.help_center_outlined),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
