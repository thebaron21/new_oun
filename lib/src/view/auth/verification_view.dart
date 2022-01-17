import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oon_client/src/view_models/verification_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class VerificationView extends StatefulWidget {
  final String username;
  final String address;
  final String opt;

  const VerificationView(
      {Key key, @required this.username, this.address, this.opt})
      : super(key: key);
  @override
  _VerificationViewState createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  @override
  void initState() {
    super.initState();
    print("User name : ${widget.username} , Address : ${widget.address}");
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    double screenhigh = MediaQuery.of(context).size.height;
    return ViewModelBuilder.reactive(
      builder: (_, VerificationViewModel modelView, Widget child) {
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
                  // Center(
                  //   child: Container(
                  //     margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  //     width: screenwidth / 1.5,
                  //     height: 45,
                  //     child: TextFormField(
                  //       cursorColor: Color(0XFFD0DD28),
                  //       textAlign: TextAlign.center,
                  //       initialValue: widget.opt,
                  //       // onSaved: (v) => opt = v,
                  //       keyboardType: TextInputType.number,
                  //       decoration: InputDecoration(
                  //         border: OutlineInputBorder(
                  //           borderRadius: const BorderRadius.all(
                  //             const Radius.circular(50.0),
                  //           ),
                  //         ),
                  //         fillColor: Colors.white,
                  //         filled: true,
                  //         focusedBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(50)),
                  //           borderSide: BorderSide(
                  //             width: 1,
                  //             color: Color(0XFFD0DD28),
                  //           ),
                  //         ),
                  //         hintText: "رقم التفعيل",
                  //         hintStyle: TextStyle(
                  //           color: Color(0XFFD0DD28),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  Center(
                    child: Container(
                      width: screenwidth / 1.5,
                      height: 40,
                      decoration: BoxDecoration(
                        //borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(2, 0),
                            color: Colors.grey,
                            spreadRadius: 0,
                            blurRadius: 2,
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: TextFormField(
                        initialValue: widget.opt,
                        textAlign: TextAlign.center,
                        readOnly: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "رقم الهاتف",
                            hintStyle: new TextStyle(
                              color: Color(0XFFD0DD28),
                            )),
                      ),
                    ),
                  ),

                  Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),

                  Center(
                    child: modelView.isLoading == true
                        ? spickit
                        : Container(
                            width: screenwidth / 1.5,
                            child: ButtonTheme(
                              height: 40,
                              buttonColor: Color(0XFF808285),
                              child: RaisedButton(
                                onPressed: () async {
                                  SharedPreferences obj =
                                      await SharedPreferences.getInstance();
                                  print(obj.getString("opt"));
                                  print("Location ${widget.address} Username : ${widget.username} Otp: ${obj.getString("opt")}");
                                  modelView.submit(
                                    context,
                                    location: widget.address,
                                    username: widget.username,
                                    opt: obj.getString("opt"),
                                  );
                                },
                                child: Text(
                                  'تفعيل',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => VerificationViewModel(),
    );
  }

  var spickit = SpinKitWave(
    size: 35,
    color: Colors.white,
  );
}
