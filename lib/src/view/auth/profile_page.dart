

import 'package:flutter/material.dart';
import 'package:oon_client/src/helpers/color_pattern.dart';
import 'package:oon_client/src/view/widgets/action_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ColorPattern colorPattern = ColorPattern();
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:AppBar(),
      body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ActionBar(
                  title: 'إرسال',
                  colorPattern: colorPattern,
                  back: () {
                    Navigator.of(context).pop();
                  },
                  help: () {},
                ),

                Center(
                  child: Text("center"),
                )
                

              ],
            ),
          ),
    );
  }
}
