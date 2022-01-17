// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'PackDetails.dart';
// import '../widgets/action_bar.dart';
// import 'page_logo.dart';
// import '../../view_models/ReciveTime_viewmodel.dart';
// import 'package:stacked/stacked.dart';

// class ReciveTime extends StatefulWidget {
//   @override
//   _ReciveTimeState createState() => _ReciveTimeState();
// }

// class _ReciveTimeState extends State<ReciveTime> {
//   @override
//   Widget build(BuildContext context) {
//     double screenwidth = MediaQuery.of(context).size.width;
// //360
//     double screenhigh = MediaQuery.of(context).size.height;

//     double C;
//     if (MediaQuery.of(context).orientation == Orientation.portrait) {
//       C = screenwidth / 2.04;
//     } else {
//       C = screenwidth / 2.04;
//     }
//     return ViewModelBuilder.reactive(
//       builder: (BuildContext context, ReciveTimeViewModel model, Widget child) {
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
//               Center(
//                 child: Text(
//                   'مواعيد الاستلام',
//                   style: TextStyle(
//                       color: model.colorPattern.primaryColor,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 24),
//                 ),
//               ),
//               Container(
//                 color: Color(0xFFF1F2F2),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Column(
//                       children: [
//                         Text('الرياض,العليا,حديقةالعليا'),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Container(
//                           alignment: Alignment.center,
//                           child: CircleAvatar(
//                             maxRadius: 10,
//                             child: Image.asset(
//                               'assets/images/png/g.png',
//                               width: 30,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Image.asset(
//                 'assets/images/png/Group2.png',
//                 height: 200,
//               ),
//               Padding(
//                 padding: EdgeInsets.fromLTRB(0, 250, 0, 0),
//               ),
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
//                             onPressed: () {},
//                             child: const Text('الرجوع',
//                                 style: TextStyle(fontSize: 20)),
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

//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => PackDetails()),
//                               );
//                             },
//                             child: const Text(' تأكيد العنوان',
//                                 style: TextStyle(fontSize: 20)),
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
//       viewModelBuilder: () => ReciveTimeViewModel(),
//     );
//   }
// }
