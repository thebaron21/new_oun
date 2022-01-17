import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:geocoding/geocoding.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oon_client/src/view/widgets/home.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'verification_view.dart';

class RegisterPage extends StatefulWidget {
  String location;
  String fullname;
  RegisterPage({this.location, this.fullname});
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  static const IconData maps_home_work_outlined =
      IconData(61871, fontFamily: 'MaterialIcons');
  TextEditingController _username = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _addressLocation = TextEditingController();
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String apiKey = 'AIzaSyD9ckDkX8LPJezARCxA1k9wuigJ_VaLLMY';
  String token = null;
  @override
  void initState() {
    super.initState();
    if (widget.location != null) {
      _addressLocation.text = widget.location;
    }
    if (widget.fullname != null) {
      _username.text = widget.fullname;
    }
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
            children: <Widget>[
              Padding(padding: EdgeInsets.fromLTRB(0, (screenhigh / 9), 0, 0)),
              SvgPicture.asset(
                'assets/images/svg/ic_small_logo.svg',
                height: 80,
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, (screenhigh / 7), 0, 0)),
              Center(
                child: Text(
                  'لطفا قم بإنشاء حساب',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: screenwidth / 1.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: screenwidth / 1.8,
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
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: TextField(
                                controller: _username,
                                cursorColor: Color(0XFF808285),
                                textAlign: TextAlign.center,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "الإسم الكامل",
                                  hintStyle: new TextStyle(
                                    color: Color(0XFF808285),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    InkWell(
                                        onTap: () {},
                                        child: Row(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  width: 10,
                                                  color: Color(0XFFD0DD28),
                                                  height: 40,
                                                )
                                              ],
                                            ),
                                            Image.asset(
                                              'assets/images/png/TF.png',
                                              color: Color(0XFF808285),
                                              height: 40,
                                            ),
                                          ],
                                        )),
                                    Center(
                                        child: Icon(
                                      Icons.person,
                                      color: Color(0XFFD0DD28),
                                    ))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: screenwidth / 1.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: screenwidth / 1.8,
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
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: TextField(
                                cursorColor: Color(0XFF808285),
                                textAlign: TextAlign.center,
                                controller: _address,
                                decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "أدخال العنوان يدويا",
                                    hintStyle: new TextStyle(
                                      color: Color(0XFF808285),
                                    )),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    InkWell(
                                        onTap: () {},
                                        child: Row(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  width: 10,
                                                  color: Color(0XFFD0DD28),
                                                  height: 40,
                                                )
                                              ],
                                            ),
                                            Image.asset(
                                              'assets/images/png/TF.png',
                                              color: Color(0XFF808285),
                                              height: 40,
                                            ),
                                          ],
                                        )),
                                    Center(
                                        child: Icon(
                                      maps_home_work_outlined,
                                      color: Color(0XFFD0DD28),
                                    ))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(10)),
              Center(
                child: Text(
                  'أو',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: screenwidth / 1.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: screenwidth / 1.8,
                              padding: EdgeInsets.only(right: 4, left: 12),
                              decoration: BoxDecoration(
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
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              alignment: Alignment.bottomCenter,
                              child: TextField(
                                controller: _addressLocation,
                                cursorColor: Color(0XFF808285),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "تحديد الموقع أتوماتيكيا",
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                    color: Color(0XFF808285),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (_username.text != null ||
                                    _username.text != "") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OpenMap(
                                        fullname: _username.text,
                                      ),
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OpenMap(),
                                    ),
                                  );
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 10,
                                            color: Color(0XFFD0DD28),
                                            height: 40,
                                          )
                                        ],
                                      ),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/png/TF.png',
                                            color: Color(0XFF808285),
                                            height: 40,
                                          ),
                                          Center(
                                            child: Icon(
                                              Icons.location_pin,
                                              color: Color(0XFFD0DD28),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
              Center(
                child: Container(
                  width: screenwidth / 1.5,
                  child: ButtonTheme(
                    height: 40,
                    buttonColor: Color(0XFF808285),
                    child: RaisedButton(
                      onPressed: () {
                        if(_username.text == null || _address.text == null){

                        }
                        openCodePage(
                          username: _username.text,
                          address: widget.location != null
                              ? widget.location
                              : _address.text,
                        );
                      },
                      child: Text(
                        'أنشيء حساب',
                        style: new TextStyle(fontSize: 18, color: Colors.white),
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
                      padding: EdgeInsets.fromLTRB(0, screenhigh / 40, 0, 0),
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
    );
  
  }

  openCodePage({String username, String address}) async {
    SharedPreferences obj = await SharedPreferences.getInstance();

    String opt = obj.getString("opt");

    print(opt);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => VerificationView(
          username: username,
          address: address,
          opt: opt,
        ),
      ),
    );
  }

  showMessage({BuildContext context, String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$message"),
    ));
  }

  showMessage2(context, {String title, String content}) {
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
}

class OpenMap extends StatefulWidget {
  final String fullname;
  static CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(12.0055, -12.32389), zoom: 18.009);

  const OpenMap({Key key, this.fullname}) : super(key: key);

  @override
  _OpenMapState createState() => _OpenMapState();
}

class _OpenMapState extends State<OpenMap> {
  String apiKey = 'AIzaSyD9ckDkX8LPJezARCxA1k9wuigJ_VaLLMY';
  // Location _location;
  Completer<GoogleMapController> completer = Completer();
  List<Marker> mapsMarker = List<Marker>();
  String address;

  @override
  void initState() {
    super.initState();
  }
  @override
  dispose(){
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: GoogleMap(
          myLocationEnabled: true,
          markers: mapsMarker.toSet(),
          onTap: (value) {
            selectLocation(value);
          },
          mapType: MapType.normal,
          initialCameraPosition: OpenMap._cameraPosition,
          onMapCreated: (con) {
            completer.complete(con);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFD0DD28),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Icon(Icons.arrow_back_ios),
        onPressed: () {
          closeMaps(address, context);
        },
      ),
    );
  }

  selectLocation(LatLng value) async {
    setState(() {
      mapsMarker.add(
        Marker(
          position: value,
          markerId: MarkerId("1"),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
        ),
      );
    });

    // List<Placemark> placemarks =
    //     await placemarkFromCoordinates(value.latitude, value.longitude);
    // print(placemarks.first);
    // setState(() {
    //   address =
    //       "${placemarks.first.country} ${placemarks.first.administrativeArea} ${placemarks.first.subAdministrativeArea} ${placemarks.first.subLocality} ${placemarks.first.street}";
    // });
    print("$address");
  }

  void closeMaps(String location, context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return RegisterPage(
            location: location,
            fullname:widget.fullname
          );
        },
      ),
    );
  }
}
