import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oon_client/src/view/widgets/home.dart';
import 'package:oon_client/src/view_models/signUP_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  
  TextEditingController _phone = TextEditingController();
  String token = null;

  @override
  void initState() {
    super.initState();
    getToken();
  }

  Future<void> getToken() async {
    try {
      SharedPreferences obj = await SharedPreferences.getInstance();
      setState(() {
        token = obj.getString("token");
      });
      if (token != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    } catch (e) {
      print("Hello World");
    }
  }

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
                          padding:
                              EdgeInsets.fromLTRB(0, (screenhigh / 5), 0, 0)),
                      SvgPicture.asset(
                        'assets/images/svg/ic_small_logo.svg',
                        height: 80,
                      ),
                      Padding(
                          padding:
                              EdgeInsets.fromLTRB(0, (screenhigh / 4), 0, 0)),
                      Center(
                        child: Text(
                          'التسجيل',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
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
                          child: TextField(
                            controller: _phone,
                            cursorColor: model.colorPattern.primaryColor,
                            textAlign: TextAlign.center,
                            decoration: new InputDecoration(
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
                        child: model.getIsLoading == true
                            ? spickit
                            : Container(
                                width: screenwidth / 1.5,
                                child: ButtonTheme(
                                  height: 40,
                                  buttonColor: Color(0XFF808285),
                                  child: RaisedButton(
                                    onPressed: () {
                                      if( _phone.text == null || _phone.text == ""){
                                        showMessage(context,
                                        title:"خطأ",
                                        content: "قم بإدخال الرقم"
                                        );
                                      }else if(_phone.text.length <= 9){
                                        showMessage(context,
                                        title:"خطأ",
                                        content: "الرقم الذي أدخلته قصير"
                                        );
                                      }
                                      else{
                                        print(_phone.text);
                                        model.signUp(context, _phone.text);
                                      }
                                    },
                                    child: Text(
                                      'تسجيل',
                                      style: new TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(40),
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
                              padding:
                                  EdgeInsets.fromLTRB(0, screenhigh / 15, 0, 0),
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
              ),
            ),
          );
        
        },
        viewModelBuilder: () => SignUPViewModel());
  }
  showMessage(context, {String title, String content}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            textAlign: TextAlign.right,
          ),
          content: Text(
            content,
            textAlign: TextAlign.right,
          ),
          actions: [
            FlatButton(
              color: Color(0xFFD0DD28),
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("موفق"),
            )
          ],
        );
      },
    );
  }

  var spickit = SpinKitWave(
    size: 35,
    color: Colors.white,
  );
}
