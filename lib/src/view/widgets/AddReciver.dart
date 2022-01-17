// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../../helpers/color_pattern.dart';
// import '../remove/pay.dart';
// import '../../view/widgets/action_bar.dart';
// import '../remove/page_logo.dart';
// import '../../view_models/Recive/AddReciver_viewmodel.dart';
// import '../../view_models/order_history_viewmodel.dart';
// import '../../view_models/order_step_two_viewmodel.dart';
// import 'package:stacked/stacked.dart';
// import '../../helpers/color_pattern.dart';

// class AddReciver extends StatefulWidget {
//   const AddReciver({
//     Key key,
//     @required this.colorPattern,
//     @required this.model,
//   }) : super(key: key);

//   final ColorPattern colorPattern;
//   final OrderHistoryViewModel model;
//   @override
//   _AddReciverState createState() => _AddReciverState();
// }

// class _AddReciverState extends State<AddReciver> {
//   @override
//   Widget build(BuildContext context) {
//     double screenwidth = MediaQuery.of(context).size.width;
// //360
//     double screenhigh = MediaQuery.of(context).size.height;

//     double A;
//     double B;
//     double C;

//     if (MediaQuery.of(context).orientation == Orientation.portrait) {
//       A = screenwidth / 1.2;
//       B = screenwidth / 1.44;
//       C = screenwidth / 2.11;
//     } else {
//       A = screenwidth / 1.2;

//       B = screenwidth / 1.44;
//       C = screenwidth / 2.11;
//     }

//     return ViewModelBuilder.reactive(
//         builder:
//             (BuildContext context, AddReciverViewModel model, Widget child) {
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
//                     'إضافة مستلم',
//                     style: TextStyle(
//                         color: model.colorPattern.primaryColor,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 24),
//                   ),
//                 ),
//                 Container(
//                   alignment: Alignment.bottomRight,
//                   margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
//                   child: Text('إسم جهة الإتصال'),
//                 ),
//                 Padding(padding: EdgeInsets.all(10)),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Column(
//                       children: [
//                         Container(
//                           width: A,
//                           child: Stack(
//                             alignment: Alignment.center,
//                             children: [
//                               Container(
//                                 height: 30,
//                                 width: A,
//                                 child: TextField(
//                                   cursorColor: Color(0XFFD0DD28),
//                                   textAlign: TextAlign.center,
//                                   controller: null,
//                                   decoration: new InputDecoration(
//                                       border: OutlineInputBorder(
//                                           borderRadius: const BorderRadius.all(
//                                               const Radius.circular(50.0))),
//                                       fillColor: Colors.white,
//                                       filled: true,
//                                       hintTextDirection: TextDirection.rtl,
//                                       focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(50)),
//                                         borderSide: BorderSide(
//                                             width: 1, color: Color(0XFFD0DD28)),
//                                       ),
//                                       hintText: "",
//                                       hintStyle: new TextStyle(
//                                         color: Color(0XFFD0DD28),
//                                       )),
//                                 ),
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Stack(
//                                     alignment: Alignment.center,
//                                     children: [
//                                       InkWell(
//                                         onTap: () {},
//                                         child: Image.asset(
//                                           'assets/images/png/TF.png',
//                                           height: 30,
//                                         ),
//                                       ),
//                                       Center(
//                                         child: Text(
//                                           '+',
//                                           style: TextStyle(color: Colors.white),
//                                         ),
//                                       )
//                                     ],
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Padding(padding: EdgeInsets.all(5)),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Column(
//                       children: [
//                         Container(
//                           width: A,
//                           child: Stack(
//                             alignment: Alignment.center,
//                             children: [
//                               Container(
//                                 height: 30,
//                                 width: A,
//                                 child: TextField(
//                                   cursorColor: Color(0XFFD0DD28),
//                                   textAlign: TextAlign.center,
//                                   controller: null,
//                                   decoration: new InputDecoration(
//                                       border: OutlineInputBorder(
//                                           borderRadius: const BorderRadius.all(
//                                               const Radius.circular(50.0))),
//                                       fillColor: Colors.white,
//                                       filled: true,
//                                       hintTextDirection: TextDirection.rtl,
//                                       focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(50)),
//                                         borderSide: BorderSide(
//                                             width: 1, color: Color(0XFFD0DD28)),
//                                       ),
//                                       hintText: "",
//                                       hintStyle: new TextStyle(
//                                         color: Color(0XFFD0DD28),
//                                       )),
//                                 ),
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Stack(
//                                     alignment: Alignment.center,
//                                     children: [
//                                       InkWell(
//                                         onTap: () {},
//                                         child: Image.asset(
//                                           'assets/images/png/TF.png',
//                                           height: 30,
//                                         ),
//                                       ),
//                                       Center(
//                                         child: Text(
//                                           'UAE',
//                                           style: TextStyle(color: Colors.white),
//                                         ),
//                                       )
//                                     ],
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Padding(padding: EdgeInsets.all(10)),
//                 Container(
//                   width: 300,
//                   height: 100,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         width: C,
//                         height: 40,
//                         child: GestureDetector(
//                           onTap: () {
//                             model.orderStatus = OrderStatus1.Completed;
//                           },
//                           child: Container(
//                             padding: EdgeInsets.all(8),
//                             color: model.orderStatus1 == OrderStatus1.Completed
//                                 ? Color(0xFFD0DD28)
//                                 : Colors.white,
//                             child: Center(
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Text('مكتملة'),
//                                   SvgPicture.asset(
//                                       'assets/images/svg/ic_completed.svg',
//                                       semanticsLabel: 'Acme Logo',
//                                       color: model.orderStatus1 ==
//                                               OrderStatus1.Completed
//                                           ? Colors.white
//                                           : Color(0xFFD0DD28)),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: C,
//                         height: 40,
//                         child: GestureDetector(
//                           onTap: () {
//                             model.orderStatus = OrderStatus1.Inprogress;
//                           },
//                           child: Container(
//                             padding: EdgeInsets.all(8),
//                             color: model.orderStatus1 == OrderStatus1.Inprogress
//                                 ? Color(0xFFD0DD28)
//                                 : Colors.white,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Text('قيد التنفيذ'),
//                                 SvgPicture.asset(
//                                     'assets/images/svg/ic_inprogress.svg',
//                                     semanticsLabel: 'Acme Logo',
//                                     color: model.orderStatus1 ==
//                                             OrderStatus1.Inprogress
//                                         ? Colors.white
//                                         : Color(0xFFD0DD28))
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(0, 235, 0, 0),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Container(
//                     alignment: Alignment.bottomCenter,
//                     child: Container(
//                       width: screenwidth,
//                       height: 40,
//                       child: RaisedButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => Pay()),
//                           );
//                         },
//                         child: const Text('إنتقل الأن إلى بوابة الدفع',
//                             style: TextStyle(fontSize: 20)),
//                         color: Color(0xFFD0DD28),
//                         textColor: Colors.white,
//                         elevation: 5,
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           );
//         },
//         viewModelBuilder: () => AddReciverViewModel());
//   }
// }
