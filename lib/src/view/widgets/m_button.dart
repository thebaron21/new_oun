import 'package:flutter/material.dart';

class MButton extends StatelessWidget {
  final String label;
  final Function onPress;
  final Color color;
  const MButton({
    Key key,
    this.label,
    this.onPress,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(16),
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48.0)),
      minWidth: MediaQuery.of(context).size.width,
      onPressed: () {
        onPress();
      },
    );
  }
}
