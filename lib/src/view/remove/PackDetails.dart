// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../widgets/AddReciver.dart';
// import '../widgets/action_bar.dart';
// import 'page_logo.dart';
// import '../../view_models/Recive/RecivePackDetails_view_model.dart';
// import '../../view_models/order_step_two_viewmodel.dart';
// import 'package:stacked/stacked.dart';

// class PackDetails extends StatefulWidget {
//   @override
//   _PackDetailsState createState() => _PackDetailsState();
// }

// class _PackDetailsState extends State<PackDetails> {
//   @override
//   Widget build(BuildContext context) {
//     double screenwidth = MediaQuery.of(context).size.width;
// //360
//     double screenhigh = MediaQuery.of(context).size.height;

//     double A;
//     double B;
//     double C;
//     double D;
//     double E;
//     double F;
//     if (MediaQuery.of(context).orientation == Orientation.portrait) {
//       A = screenwidth / 5.14;
//       B = screenwidth / 7.2;
//       C = screenwidth / 1.2;
//       D = screenwidth / 12;
//       E = screenwidth / 2.4;
//       F = screenwidth / 1.8;
//     } else {
//       A = screenwidth / 5.14;
//       B = screenwidth / 7.2;
//       C = screenwidth / 1.2;
//       D = screenwidth / 12 * 3;
//       E = screenwidth / 2.4;
//       F = screenwidth / 1.8;
//     }
//     return ViewModelBuilder.reactive(
//         builder:
//             (BuildContext context, PackDetailsViewModel model, Widget child) {
//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: model.colorPattern.primaryColor,
//               centerTitle: true,
//               title: Container(
//                 child: SvgPicture.asset(
//                   'assets/images/svg/ic_small_logo.svg',
//                   height: 40,
//                 ),
//               ),
//               leadingWidth: 48,
//               leading: Container(
//                 padding: EdgeInsets.all(8),
//                 child: SvgPicture.asset(
//                   'assets/images/svg/ic_menu.svg',
//                 ),
//               ),
//             ),
//             body: ListView(
//               children: [
//                 ActionBar(
//                   title: 'إرسال',
//                   colorPattern: model.colorPattern,
//                   back: () {},
//                   help: () {},
//                 ),
//                 PageLogo(
//                   imagePath: 'assets/images/svg/ic_step2.svg',
//                   height: 60,
//                 ),
//                 Center(
//                   child: Text(
//                     'تفاصيل الشحنة',
//                     style: TextStyle(
//                         color: model.colorPattern.primaryColor,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 24),
//                   ),
//                 ),
//                 Container(
//                   color: Color(0xFFF1F2F2),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Column(
//                         children: [
//                           Text('الرياض,العليا,حديقةالعليا'),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Container(
//                             alignment: Alignment.center,
//                             child: CircleAvatar(
//                               maxRadius: 10,
//                               child: Image.asset(
//                                 'assets/images/png/g.png',
//                                 width: 30,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Image.asset(
//                   'assets/images/png/gg.png',
//                 ),
//                 Container(
//                   alignment: Alignment.bottomRight,
//                   margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
//                   child: Text('حجم الشحنة'),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Column(
//                       children: [
//                         Row(
//                           children: [
//                             Column(
//                               children: [
//                                 Container(
//                                   width: A,
//                                   child: Image.asset(
//                                     'assets/images/png/g5.png',
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Padding(padding: EdgeInsets.all(5)),
//                             Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Text('كبير'),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Text(
//                                       '50*50*75cm 30kgm',
//                                       style: TextStyle(fontSize: 10),
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                     Padding(padding: EdgeInsets.fromLTRB(D, 0, 0, 0)),
//                     Column(
//                       children: [
//                         Row(
//                           children: [
//                             Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
//                             Column(
//                               children: [
//                                 Container(
//                                   width: B,
//                                   child: Image.asset(
//                                     'assets/images/png/g4.png',
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Padding(padding: EdgeInsets.all(5)),
//                             Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Text('صغير'),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Text(
//                                       '50*50*75cm 30kgm',
//                                       style: TextStyle(fontSize: 10),
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             )
//                           ],
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Container(
//                       alignment: Alignment.bottomRight,
//                       margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
//                       child: Text('تفاصيل محتوى الشحنة'),
//                     ),
//                     Container(
//                       height: 30,
//                       width: C,
//                       child: TextField(
//                         cursorColor: Color(0XFFD0DD28),
//                         textAlign: TextAlign.center,
//                         controller: null,
//                         decoration: new InputDecoration(
//                             border: OutlineInputBorder(
//                                 borderRadius: const BorderRadius.all(
//                                     const Radius.circular(50.0))),
//                             fillColor: Colors.white,
//                             filled: true,
//                             hintTextDirection: TextDirection.rtl,
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(50)),
//                               borderSide: BorderSide(
//                                   width: 1, color: Color(0XFFD0DD28)),
//                             ),
//                             hintText: "",
//                             hintStyle: new TextStyle(
//                               color: Color(0XFFD0DD28),
//                             )),
//                       ),
//                     ),
//                     Container(
//                       alignment: Alignment.bottomRight,
//                       margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
//                       child: Text('أدخل قيمة الشحنة'),
//                     ),
//                     Container(
//                       width: C,
//                       height: 30,
//                       child: TextField(
//                         cursorColor: Color(0XFFD0DD28),
//                         textAlign: TextAlign.center,
//                         controller: null,
//                         decoration: new InputDecoration(
//                             border: OutlineInputBorder(
//                                 borderRadius: const BorderRadius.all(
//                                     const Radius.circular(50.0))),
//                             fillColor: Colors.white,
//                             filled: true,
//                             hintTextDirection: TextDirection.rtl,
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(50)),
//                               borderSide: BorderSide(
//                                   width: 1, color: Color(0XFFD0DD28)),
//                             ),
//                             hintText: "",
//                             hintStyle: new TextStyle(
//                               color: Color(0XFFD0DD28),
//                             )),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(0, 110, 0, 0),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Column(
//                       children: [
//                         Align(
//                           alignment: Alignment.bottomCenter,
//                           child: Container(
//                             width: E,
//                             child: RaisedButton(
//                               onPressed: () {},
//                               child: const Text('الرجوع',
//                                   style: TextStyle(fontSize: 20)),
//                               color: Color(0xFF6D6F72),
//                               textColor: Colors.white,
//                               elevation: 5,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Align(
//                           alignment: Alignment.bottomCenter,
//                           child: Container(
//                             width: F,
//                             child: RaisedButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => AddReciver()),
//                                 );
//                               },
//                               child: const Text('  إنتقل إلى معلومات الشحنة',
//                                   style: TextStyle(fontSize: 20)),
//                               color: Color(0xFFD0DD28),
//                               textColor: Colors.white,
//                               elevation: 5,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           );
//         },
//         viewModelBuilder: () => PackDetailsViewModel());
//   }
// }
