import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../view_models/signUP_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../auth/verification_view.dart';

class signUP extends StatefulWidget {
  @override
  _signUPState createState() => _signUPState();
}

class _signUPState extends State<signUP> {
  TextEditingController _phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (BuildContext context, SignUPViewModel model, Widget child) {
        double screenwidth = MediaQuery.of(context).size.width;

        double screenhigh = MediaQuery.of(context).size.height;
        return Scaffold(
            backgroundColor: Color(0XFFD0DD28),
            body: new Theme(
                data: ThemeData(primaryColor: Color(0XFFD0DD28)),
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/images/svg/background.svg',
                      fit: BoxFit.fill,
                    ),
                    ListView(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, (screenhigh / 4) - 50, 0, 0),
                        ),
                        SvgPicture.asset(
                          'assets/images/svg/ic_small_logo.svg',
                          height: 80,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.fromLTRB(0, (screenhigh / 4), 0, 0),
                        ),
                        Center(
                          child: Text(
                            'التسجيل',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            width: screenwidth / 1.5,
                            height: 40,
                            child: TextField(
                              cursorColor: Color(0XFFD0DD28),
                              textAlign: TextAlign.center,
                              controller: _phone,
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
                                    width: 1,
                                    color: Color(0XFFD0DD28),
                                  ),
                                ),
                                hintText: "رقم الهاتف",
                                hintStyle: new TextStyle(
                                  color: Color(0XFFD0DD28),
                                ),
                              ),
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
                                  print(_phone.text);
                                  model.signUp(context, _phone.text);
                                },
                                child: model.getIsLoading == true
                                    ? CircularProgressIndicator()
                                    : Text(
                                        'تسجيل',
                                        style: new TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(40),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              ),
                              Text(
                                'سيصلك كود التفعيل خلال دقيقة',
                                style: new TextStyle(color: Colors.white),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0, screenhigh / 15, 0, 0),
                              ),
                              Text(
                                'بالضغط على زر تنشيط فأنت توافق على ',
                                style: new TextStyle(color: Colors.white70),
                              ),
                              Text(
                                'شروط التطبيق',
                                style: new TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )));
      },
      viewModelBuilder: () => SignUPViewModel(),
    );
    ;
  }
}
