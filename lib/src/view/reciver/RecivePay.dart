import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oon_client/src/services/recive_service.dart';
import 'package:oon_client/src/view/remove/page_logo.dart';
import 'package:oon_client/src/view/widgets/action_bar.dart';
import 'package:oon_client/src/view_models/Recive/RecivePay_veiwmodel.dart';
import 'package:stacked/stacked.dart';

import 'Done.dart';

class RecivePay extends StatefulWidget {
  final String weight;

  const RecivePay({Key key, this.weight}) : super(key: key);
  @override
  _RecivePayState createState() => _RecivePayState();
}

class _RecivePayState extends State<RecivePay> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return ViewModelBuilder.reactive(
      builder: (BuildContext context, RecivePayViewModel model, Widget child) {
        Size size = MediaQuery.of(context).size;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: model.colorPattern.primaryColor,
            centerTitle: true,
            title: Container(
              child: SvgPicture.asset(
                'assets/images/svg/ic_small_logo.svg',
                height: 40,
              ),
            ),
            leadingWidth: 48,
            // leading: Container(
            //   padding: EdgeInsets.all(8),
            //   child: SvgPicture.asset(
            //     'assets/images/svg/ic_menu.svg',
            //   ),
            // ),
          ),
          body: ListView(
            children: [
              ActionBar(
                title: 'إرسال',
                colorPattern: model.colorPattern,
                back: () {
                  Navigator.of(context).pop();
                },
                help: () {},
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  PageLogo(
                    imagePath: 'assets/images/svg/ic_circle.svg',
                    height: 60,
                  ),
                  PageLogo(
                    imagePath: 'assets/images/svg/ic_comp.svg',
                    height: 40,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              ),
              Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                child: Text('وسيلة الدفع المفضلة'),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: screenwidth / 2,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color(0xFFF1F2F2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: GestureDetector(
                          onTap: () {
                            model.orderStatus = OrderStatus2.Completed;
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            color: model.orderStatus == OrderStatus2.Completed
                                ? Color(0xFFD0DD28)
                                : Colors.white,
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('بطاقة الإئتمان أو الخصم'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFF1F2F2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        width: screenwidth / 2,
                        height: 40,
                        child: GestureDetector(
                          onTap: () {
                            model.orderStatus = OrderStatus2.Inprogress;
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            color: model.orderStatus == OrderStatus2.Inprogress
                                ? Color(0xFFD0DD28)
                                : Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('الدفع عند الإستلام'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              // Container(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Container(
              //         width: 170,
              //         height: 40,
              //         decoration: BoxDecoration(
              //             color: Color(0xFFF1F2F2),
              //             borderRadius: BorderRadius.all(Radius.circular(50))),
              //         child: GestureDetector(
              //           onTap: () {
              //             // model.orderStatus = OrderStatus2.Completed;
              //           },
              //           child: Container(
              //             padding: EdgeInsets.all(8),
              //             color: model.orderStatus == OrderStatus2.Completed
              //                 ? Color(0xFFD0DD28)
              //                 : Colors.white,
              //             child: Center(
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
              //                 children: [
              //                   Text('بطاقة الإئتمان أو الخصم'),
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              //       ),
              //       Container(
              //         decoration: BoxDecoration(
              //             color: Color(0xFFF1F2F2),
              //             borderRadius: BorderRadius.all(Radius.circular(50))),
              //         width: 170,
              //         height: 40,
              //         child: GestureDetector(
              //           onTap: () {
              //             // model.orderStatus = OrderStatus2.Inprogress;
              //           },
              //           child: Container(
              //             padding: EdgeInsets.all(8),
              //             color: model.orderStatus == OrderStatus2.Inprogress
              //                 ? Color(0xFFD0DD28)
              //                 : Colors.white,
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceAround,
              //               children: [
              //                 Text('الدفع عند الإستلام'),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Padding(padding: EdgeInsets.all(10)),
              Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Text('تحليل التكاليف'),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Container(
                color: Color(0xFFD0DD28),
                width: 150,
                height: 30,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.all(20)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 100, 0)),
                        Text('شحن عادي')
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 220, 0)),
                        Text('${widget.weight} AED')
                      ],
                    )
                  ],
                ),
              ),
              Container(
                color: Color(0xFFF1F2F2),
                width: 150,
                height: 30,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.all(20)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 100, 0)),
                        Text('خصم')
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 220, 0)),
                        Text('0 AED')
                      ],
                    )
                  ],
                ),
              ),
              Container(
                color: Color(0xFF6D6F72),
                width: 150,
                height: 30,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.all(20)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 100, 0)),
                        Text('المجموع')
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(0, 0, 220, 0)),
                        Text('${widget.weight} AED')
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 250, 0, 0),
              ),
            ],
          ),
          bottomSheet: Container(
            width: size.width,
            height: 47,
            child: RaisedButton(
              onPressed: () {
                model.goToDone(context);
              },
              child: model.isLoading == true
                  ? spickit
                  : Text('تنفيذ الطلب', style: TextStyle(fontSize: 20)),
              color: Color(0xFFD0DD28),
              textColor: Colors.white,
              elevation: 5,
            ),
          ),
        );
      },
      viewModelBuilder: () => RecivePayViewModel(),
    );
  }

  var spickit = SpinKitWave(
    size: 35,
    color: Colors.white,
  );
}
