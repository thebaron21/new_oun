// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'ReciveTime.dart';
// import '../widgets/action_bar.dart';
// import 'page_logo.dart';
// import '../../view_models/ExtraInfo.dart';
// import 'package:stacked/stacked.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '../ReciveLocate.dart';
// import 'package:geocode/geocode.dart';

// class ExtraInfo extends StatefulWidget {
//   Address address;
//   LatLng latLng;

//   ExtraInfo({Key key, this.address, this.latLng}) : super(key: key);
//   @override
//   _ExtraInfoState createState() => _ExtraInfoState();
// }

// class _ExtraInfoState extends State<ExtraInfo> {
//   @override
//   Widget build(BuildContext context) {
//     double screenwidth = MediaQuery.of(context).size.width;
// //360
//     double screenhigh = MediaQuery.of(context).size.height;
//     double A;
//     double B;
//     double C;
//     if (MediaQuery.of(context).orientation == Orientation.portrait) {
//       A = screenwidth / 1.44;
//       B = screenhigh / 25.33;
//       C = screenwidth / 2.04;
//     } else {
//       A = screenwidth / 1.44;
//       B = screenhigh / 12;

//       C = screenwidth / 2.04;
//     }
//     TextEditingController _description = TextEditingController();

//     return ViewModelBuilder.reactive(
//       builder: (BuildContext context, ExtraInfoViewModel model, Widget child) {
//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: model.colorPattern.primaryColor,
//             centerTitle: true,
//             title: Container(
//               child: SvgPicture.asset(
//                 'assets/images/svg/ic_small_logo.svg',
//                 height: 40,
//               ),
//             ),
//             leadingWidth: 48,
//             leading: Container(
//               padding: EdgeInsets.all(8),
//               child: SvgPicture.asset(
//                 'assets/images/svg/ic_menu.svg',
//               ),
//             ),
//           ),
//           body: ListView(
//             children: [
//               ActionBar(
//                 title: 'إرسال',
//                 colorPattern: model.colorPattern,
//                 back: () {},
//                 help: () {},
//               ),
//               PageLogo(
//                 imagePath: 'assets/images/svg/ic_step2.svg',
//                 height: 60,
//               ),
//               Padding(
//                 padding: EdgeInsets.fromLTRB(0, 225, 0, 0),
//               ),
//               Container(
//                   width: 200,
//                   height: 280,
//                   margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                   decoration: BoxDecoration(
//                     color: Color(0xFFF1F2F2),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(50),
//                     ),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
//                       ),
//                       Text(
//                         'هل ترغب بإضافة تفاصيل إضافية للعنوان؟',
//                       ),
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
//                       ),
//                       Container(
//                         height: B,
//                         width: A,
//                         child: TextField(
//                           cursorColor: Color(0XFFD0DD28),
//                           textAlign: TextAlign.center,
//                           controller: _description,
//                           decoration: new InputDecoration(
//                             border: OutlineInputBorder(
//                               borderRadius: const BorderRadius.all(
//                                 const Radius.circular(50.0),
//                               ),
//                             ),
//                             fillColor: Colors.white,
//                             filled: true,
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                               borderSide: BorderSide(
//                                 width: 1,
//                                 color: Color(0XFFD0DD28),
//                               ),
//                             ),
//                             hintText: "",
//                             hintStyle: new TextStyle(
//                               color: Color(0XFFD0DD28),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Column(
//                             children: [
//                               RaisedButton(
//                                 onPressed: () {
//                                   _description.clear();
//                                 },
//                                 child: Text(
//                                   'إلغاء',
//                                   style: new TextStyle(
//                                       fontSize: 18, color: Colors.white),
//                                 ),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: new BorderRadius.circular(40),
//                                 ),
//                                 color: Color(0xFFD0DD28),
//                               ),
//                             ],
//                           ),
//                           Padding(
//                             padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
//                           ),
//                           Column(
//                             children: [
//                               RaisedButton(
//                                 onPressed: () {
//                                   print("Description ${_description.text}");
//                                   if (_description.text == "") {
//                                     print("Null");
//                                   }
//                                   print(
//                                       "Address : ${widget.address} , LatLng : ${widget.latLng}");
//                                 },
//                                 child: Text(
//                                   'إضافة',
//                                   style: new TextStyle(
//                                       fontSize: 18, color: Colors.white),
//                                 ),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: new BorderRadius.circular(40),
//                                 ),
//                                 color: Color(0xFFD0DD28),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                       // Text('-----------------------------------------------------------------------------'),
//                       Divider(
//                         indent: 20,
//                         thickness: 1,
//                         endIndent: 20,
//                         height: 10,
//                         color: Colors.black,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Column(
//                             children: [
//                               Text(
//                                   "${widget.address.countryName} , ${widget.address.city} , ${widget.address.streetAddress}")
//                               // Text('الرياض,العليا,حديقةالعليا'),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Container(
//                                 margin: const EdgeInsets.fromLTRB(0, 0, 50, 0),
//                                 alignment: Alignment.bottomRight,
//                                 child: CircleAvatar(
//                                   child:
//                                       Image.asset('assets/images/png/g1.png'),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Padding(padding: EdgeInsets.all(3)),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Column(
//                             children: [
//                               Text('160,20'),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Container(
//                                 margin: const EdgeInsets.fromLTRB(0, 0, 50, 0),
//                                 alignment: Alignment.bottomRight,
//                                 child: CircleAvatar(
//                                   child: Image.asset('assets/images/png/g.png'),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   )),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       Align(
//                         alignment: Alignment.bottomCenter,
//                         child: Container(
//                           width: C,
//                           child: RaisedButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => ReciveLocate(),
//                                 ),
//                               );
//                             },
//                             child: const Text(
//                               'الرجوع',
//                               style: TextStyle(fontSize: 20),
//                             ),
//                             color: Color(0xFF6D6F72),
//                             textColor: Colors.white,
//                             elevation: 5,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Align(
//                         alignment: Alignment.bottomCenter,
//                         child: Container(
//                           width: C,
//                           child: RaisedButton(
//                             onPressed: () {
//                               /*
//                                     Description is not null
//                                     LatLng
//                                     Location
//                                  */
//                               model.sendLocationRecive(
//                                   address: null, loactionRecive: null);
//                             },
//                             child: const Text(
//                               ' تأكيد العنوان',
//                               style: TextStyle(fontSize: 20),
//                             ),
//                             color: Color(0xFFD0DD28),
//                             textColor: Colors.white,
//                             elevation: 5,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               )
//             ],
//           ),
//         );
//       },
//       viewModelBuilder: () => ExtraInfoViewModel(),
//     );
//   }
// }

// /*

// class ScrollableFooter extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//       return SingleChildScrollView(
//         child: ConstrainedBox(
//           constraints: constraints.copyWith(
//             minHeight: constraints.maxHeight,
//             maxHeight: double.infinity,
//           ),
//           child: IntrinsicHeight(
//             child: Column(
//               children: <Widget>[
//                // Your body widgets here
//                 Expanded(
//                   child: Align(
//                     alignment: Alignment.bottomCenter,
//                     child: // Your footer widget
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }*/