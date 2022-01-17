// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:oon_client/src/view/reciver/Done.dart';
// import '../../helpers/color_pattern.dart';
// import '../widgets/action_bar.dart';
// import 'page_logo.dart';
// import '../../view_models/Recive/RecivePay_veiwmodel.dart';
// import '../../view_models/order_history_viewmodel.dart';
// import 'package:stacked/stacked.dart';

// class Pay extends StatefulWidget {
//   const Pay({
//     Key key,
//     this.colorPattern,
//     this.model,
//   }) : super(key: key);

//   final ColorPattern colorPattern;
//   final OrderHistoryViewModel model;
//   @override
//   _PayState createState() => _PayState();
// }

// class _PayState extends State<Pay> {
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder.reactive(
//       builder: (BuildContext context, PayViewModel model, Widget child) {
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
//                 padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
//               ),
//               Container(
//                 alignment: Alignment.bottomRight,
//                 margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
//                 child: Text('وسيلة الدفع المفضلة'),
//               ),
//               Padding(padding: EdgeInsets.all(10)),
//               Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       width: 170,
//                       height: 40,
//                       decoration: BoxDecoration(
//                           color: Color(0xFFF1F2F2),
//                           borderRadius: BorderRadius.all(Radius.circular(50))),
//                       child: GestureDetector(
//                         onTap: () {
//                           model.orderStatus = OrderStatus2.Completed;
//                         },
//                         child: Container(
//                           padding: EdgeInsets.all(8),
//                           color: model.orderStatus == OrderStatus2.Completed
//                               ? Color(0xFFD0DD28)
//                               : Colors.white,
//                           child: Center(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Text('بطاقة الإئتمان أو الخصم'),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           color: Color(0xFFF1F2F2),
//                           borderRadius: BorderRadius.all(Radius.circular(50))),
//                       width: 170,
//                       height: 40,
//                       child: GestureDetector(
//                         onTap: () {
//                           model.orderStatus = OrderStatus2.Inprogress;
//                         },
//                         child: Container(
//                           padding: EdgeInsets.all(8),
//                           color: model.orderStatus == OrderStatus2.Inprogress
//                               ? Color(0xFFD0DD28)
//                               : Colors.white,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Text('الدفع عند الإستلام'),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(padding: EdgeInsets.all(10)),
//               Container(
//                 alignment: Alignment.bottomRight,
//                 margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
//                 child: Text('تحليل التكاليف'),
//               ),
//               Padding(padding: EdgeInsets.all(10)),
//               Container(
//                 color: Color(0xFFD0DD28),
//                 width: 150,
//                 height: 30,
//                 alignment: Alignment.center,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Padding(padding: EdgeInsets.all(20)),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Padding(padding: EdgeInsets.fromLTRB(0, 0, 100, 0)),
//                         Text('شحن عادي')
//                       ],
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Padding(padding: EdgeInsets.fromLTRB(0, 0, 220, 0)),
//                         Text('50 AED')
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 color: Color(0xFFF1F2F2),
//                 width: 150,
//                 height: 30,
//                 alignment: Alignment.center,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Padding(padding: EdgeInsets.all(20)),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Padding(padding: EdgeInsets.fromLTRB(0, 0, 100, 0)),
//                         Text('خصم')
//                       ],
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Padding(padding: EdgeInsets.fromLTRB(0, 0, 220, 0)),
//                         Text('0 AED')
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 color: Color(0xFF6D6F72),
//                 width: 150,
//                 height: 30,
//                 alignment: Alignment.center,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Padding(padding: EdgeInsets.all(20)),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Padding(padding: EdgeInsets.fromLTRB(0, 0, 100, 0)),
//                         Text('المجموع')
//                       ],
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Padding(padding: EdgeInsets.fromLTRB(0, 0, 220, 0)),
//                         Text('50 AED')
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.fromLTRB(0, 250, 0, 0),
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   alignment: Alignment.bottomCenter,
//                   child: Container(
//                     width: 370,
//                     height: 47,
//                     child: RaisedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Done()),
//                         );
//                       },
//                       child: const Text('تنفيذ الطلب',
//                           style: TextStyle(fontSize: 20)),
//                       color: Color(0xFFD0DD28),
//                       textColor: Colors.white,
//                       elevation: 5,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         );
//       },
//       viewModelBuilder: () => PayViewModel(),
//     );
//   }
// }
