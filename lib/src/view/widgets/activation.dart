import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../view_models/Activation_viewmodel.dart';
import 'package:stacked/stacked.dart';

import 'home.dart';

class Activation extends StatefulWidget {
  @override
  _ActivationState createState() => _ActivationState();
}

class _ActivationState extends State<Activation> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        builder:
            (BuildContext context, ActivationViewModel model, Widget child) {
          double screenwidth = MediaQuery.of(context).size.width;

          double screenhigh = MediaQuery.of(context).size.height;
          return Scaffold(
            backgroundColor: Color(0XFFD0DD28),
            body: Stack(
              children: [
                SvgPicture.asset(
                  'assets/images/svg/background.svg',
                  fit: BoxFit.fill,
                ),
                ListView(
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.fromLTRB(0, (screenhigh / 2.8), 0, 0)),
                    Center(
                      child: Text(
                        'التفعيل',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        width: screenwidth / 1.5,
                        height: 45,
                        child: TextField(
                          cursorColor: Color(0XFFD0DD28),
                          textAlign: TextAlign.center,
                          controller: null,
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(50.0),
                                ),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide(
                                    width: 1, color: Color(0XFFD0DD28)),
                              ),
                              hintText: "رقم التفعيل",
                              hintStyle: new TextStyle(
                                color: Color(0XFFD0DD28),
                              )),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                    Center(
                      child: Container(
                        width: screenwidth / 1.5,
                        child: ButtonTheme(
                            height: 40,
                            buttonColor: Color(0XFF808285),
                            child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'تفعيل',
                                  style: new TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(40),
                                ))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        viewModelBuilder: () => ActivationViewModel());
  }
}
