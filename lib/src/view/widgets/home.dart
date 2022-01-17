import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oon_client/src/helpers/color_pattern.dart';
import 'package:oon_client/src/view_models/home_viewmodel.dart';
import '../remove/page_logo.dart';
import 'package:stacked/stacked.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (BuildContext context, HomeViewModel model, Widget child) {
        
      
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
