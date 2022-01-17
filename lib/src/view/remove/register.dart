// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'New folder/verification_view.dart';

// class Register extends StatefulWidget {
//   @override
//   _RegisterState createState() => _RegisterState();
// }

// class _RegisterState extends State<Register> {
//   static const IconData maps_home_work_outlined =
//       IconData(61871, fontFamily: 'MaterialIcons');
//   String _username;
//   String _address;
//   String _addressLocation;
//   GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
//   String apiKey = 'AIzaSyD9ckDkX8LPJezARCxA1k9wuigJ_VaLLMY';
//   @override
//   void initState() {
//     super.initState();
//     print("Username ${_username} , Address ${_address}");
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenwidth = MediaQuery.of(context).size.width;
//     double screenhigh = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Color(0XFFD0DD28),
//       body: Form(
//         key: _globalKey,
//         child: new Theme(
//           data: ThemeData(primaryColor: Color(0XFFD0DD28)),
//           child: Stack(
//             children: [
//               SvgPicture.asset(
//                 'assets/images/svg/background.svg',
//                 fit: BoxFit.fill,
//               ),
//               ListView(
//                 children: <Widget>[
//                   Padding(
//                     padding:
//                         EdgeInsets.fromLTRB(0, (screenhigh / 8) - 50, 0, 0),
//                   ),
//                   SvgPicture.asset(
//                     'assets/images/svg/ic_small_logo.svg',
//                     height: 50,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(0, (screenhigh / 7), 0, 0),
//                   ),
//                   Center(
//                     child: Text(
//                       'لطفا قم بإنشاء حساب',
//                       style: TextStyle(color: Colors.white, fontSize: 24),
//                     ),
//                   ),
//                   Padding(padding: EdgeInsets.all(10)),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Column(
//                         children: [
//                           Container(
//                             width: 300,
//                             child: Stack(
//                               alignment: Alignment.center,
//                               children: [
//                                 Container(
//                                   height: 40,
//                                   width: 300,
//                                   child: TextFormField(
//                                     cursorColor: Color(0XFFD0DD28),
//                                     textAlign: TextAlign.center,
//                                     onSaved: (value) => _username = value,
//                                     decoration: new InputDecoration(
//                                       border: OutlineInputBorder(
//                                         borderRadius: const BorderRadius.all(
//                                           const Radius.circular(50.0),
//                                         ),
//                                       ),
//                                       fillColor: Colors.white,
//                                       filled: true,
//                                       hintTextDirection: TextDirection.rtl,
//                                       focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.all(
//                                           Radius.circular(50),
//                                         ),
//                                         borderSide: BorderSide(
//                                           width: 1,
//                                           color: Color(0XFFD0DD28),
//                                         ),
//                                       ),
//                                       hintText: "الإسم الكامل",
//                                       hintStyle: new TextStyle(
//                                         color: Color(0XFF808285),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     Stack(
//                                       alignment: Alignment.center,
//                                       children: [
//                                         InkWell(
//                                           onTap: () {},
//                                           child: Row(
//                                             children: [
//                                               Column(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.end,
//                                                 children: [
//                                                   Container(
//                                                     width: 10,
//                                                     color: Color(0XFFD0DD28),
//                                                     height: 40,
//                                                   )
//                                                 ],
//                                               ),
//                                               Image.asset(
//                                                 'assets/images/png/TF.png',
//                                                 color: Color(0XFF808285),
//                                                 height: 40,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Center(
//                                             child: Icon(
//                                           Icons.person,
//                                           color: Color(0XFFD0DD28),
//                                         ))
//                                       ],
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Padding(padding: EdgeInsets.all(10)),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Column(
//                         children: [
//                           Container(
//                             width: 300,
//                             child: Stack(
//                               alignment: Alignment.center,
//                               children: [
//                                 Container(
//                                   height: 40,
//                                   width: 300,
//                                   child: TextFormField(
//                                     // ignore: missing_return
//                                     validator: (value) {
//                                       if (value.isEmpty) {
//                                         showMessage(
//                                             context: context,
//                                             message: "ادخل الاسم المستخدم");
//                                       }
//                                     },
//                                     cursorColor: Color(0XFFD0DD28),
//                                     textAlign: TextAlign.center,
//                                     onSaved: (value) => _address = value,
//                                     initialValue: null,
//                                     decoration: new InputDecoration(
//                                       border: OutlineInputBorder(
//                                         borderRadius: const BorderRadius.all(
//                                           const Radius.circular(50.0),
//                                         ),
//                                       ),
//                                       fillColor: Colors.white,
//                                       filled: true,
//                                       hintTextDirection: TextDirection.rtl,
//                                       focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.all(
//                                           Radius.circular(50),
//                                         ),
//                                         borderSide: BorderSide(
//                                           width: 1,
//                                           color: Color(0XFFD0DD28),
//                                         ),
//                                       ),
//                                       hintText: "أدخال العنوان يدويا",
//                                       hintStyle: new TextStyle(
//                                         color: Color(0XFF808285),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     Stack(
//                                       alignment: Alignment.center,
//                                       children: [
//                                         InkWell(
//                                           onTap: () {},
//                                           child: Row(
//                                             children: [
//                                               Column(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.end,
//                                                 children: [
//                                                   Container(
//                                                     width: 10,
//                                                     color: Color(0XFFD0DD28),
//                                                     height: 40,
//                                                   )
//                                                 ],
//                                               ),
//                                               Image.asset(
//                                                 'assets/images/png/TF.png',
//                                                 color: Color(0XFF808285),
//                                                 height: 40,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Center(
//                                           child: Icon(
//                                             maps_home_work_outlined,
//                                             color: Color(0XFFD0DD28),
//                                           ),
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Padding(padding: EdgeInsets.all(10)),
//                   Center(
//                     child: Text(
//                       'أو',
//                       style: TextStyle(color: Colors.white, fontSize: 24),
//                     ),
//                   ),
//                   Padding(padding: EdgeInsets.all(10)),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Column(
//                         children: [
//                           Container(
//                             width: 300,
//                             child: Stack(
//                               alignment: Alignment.center,
//                               children: [
//                                 Container(
//                                   height: 40,
//                                   width: 300,
//                                   child: TextFormField(
//                                     initialValue: null,
//                                     cursorColor: Color(0XFFD0DD28),
//                                     textAlign: TextAlign.center,
//                                     onSaved: (value) =>
//                                         _addressLocation = value,
//                                     // ignore: missing_return
//                                     validator: (value) {
//                                       if (value.isEmpty) {
//                                         return showMessage(
//                                             context: context,
//                                             message: "ادخل العنوان");
//                                       }
//                                     },
//                                     decoration: new InputDecoration(
//                                       border: OutlineInputBorder(
//                                         borderRadius: const BorderRadius.all(
//                                           const Radius.circular(50.0),
//                                         ),
//                                       ),
//                                       fillColor: Colors.white,
//                                       filled: true,
//                                       hintTextDirection: TextDirection.rtl,
//                                       focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.all(
//                                           Radius.circular(50),
//                                         ),
//                                         borderSide: BorderSide(
//                                           width: 1,
//                                           color: Color(0XFFD0DD28),
//                                         ),
//                                       ),
//                                       hintText: "تحديد الموقع أتوماتيكيا",
//                                       hintStyle: new TextStyle(
//                                         color: Color(0XFF808285),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     Stack(
//                                       alignment: Alignment.center,
//                                       children: [
//                                         InkWell(
//                                           onTap: () {
//                                           },
//                                           child: Row(
//                                             children: [
//                                               Column(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.end,
//                                                 children: [
//                                                   Container(
//                                                     width: 10,
//                                                     color: Color(0XFFD0DD28),
//                                                     height: 40,
//                                                   )
//                                                 ],
//                                               ),
//                                               Image.asset(
//                                                 'assets/images/png/TF.png',
//                                                 color: Color(0XFF808285),
//                                                 height: 40,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Center(
//                                           child: Icon(
//                                             Icons.location_pin,
//                                             color: Color(0XFFD0DD28),
//                                           ),
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
//                   Center(
//                     child: Container(
//                       width: screenwidth / 1.5,
//                       child: ButtonTheme(
//                         height: 40,
//                         buttonColor: Color(0XFF808285),
//                         // ignore: deprecated_member_use
//                         child: RaisedButton(
//                           onPressed: () {
//                             // Navigator.push(
//                             //     context,
//                             //     MaterialPageRoute(
//                             //         builder: (context) =>
//                             //         ),
//                             //   );
//                             validatorData();
//                           },
//                           child: Text(
//                             'أنشيء حساب',
//                             style: new TextStyle(
//                               fontSize: 18,
//                               color: Colors.white,
//                             ),
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: new BorderRadius.circular(40),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Center(
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding:
//                               EdgeInsets.fromLTRB(0, screenhigh / 40, 0, 0),
//                         ),
//                         Text(
//                           'بالضغط على زر تنشيط فأنت توافق على ',
//                           style: new TextStyle(color: Colors.white70),
//                         ),
//                         Text(
//                           'شروط التطبيق',
//                           style: new TextStyle(color: Colors.white),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   validatorData() {
//     final _key = _globalKey.currentState;
//     if (_key.validate()) {
//       _key.save();
//       print("Username : $_username , Address : $_address");
//     }
//     openCodePage(username: _username, address: _address);
//   }

//   openCodePage({String username, String address}) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) =>
//             VerificationView(username: username, address: address),
//       ),
//     );
//   }

//   showMessage({BuildContext context, String message}) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text("$message"),
//     ));
//   }

//   List<Marker> mapsMarker = List<Marker>();
//   selectLocation(LatLng value) async {
//     setState(() {
//       mapsMarker.clear();
//       mapsMarker.add(
//         Marker(
//           position: value,
//           markerId: MarkerId("1"),
//           icon:
//               BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
//         ),
//       );
//     });
//   }

//   openMaps() {
//     Completer<GoogleMapController> completer = Completer();
//     CameraPosition _cameraPosition =
//         CameraPosition(target: LatLng(12.0055, -12.32389), zoom: 18.009);
//     mapsMarker.add(Marker(
//       position: LatLng(12.0055, -12.32389),
//       markerId: MarkerId("inital"),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
//     ));
//     return Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (BuildContext context) {
//           Size size = MediaQuery.of(context).size;
//           return Expanded(
//             child: Container(
//               width: size.width,
//               child: GoogleMap(
//                 myLocationButtonEnabled: true,
//                 markers: mapsMarker.toSet(),
//                 onTap: (value) {
//                   selectLocation(value);
//                 },
//                 myLocationEnabled: true,
//                 mapType: MapType.normal,
//                 initialCameraPosition: _cameraPosition,
//                 onMapCreated: (con) {
//                   completer.complete(con);
//                 },
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
