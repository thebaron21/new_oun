import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oon_client/src/helpers/color_pattern.dart';
import 'package:oon_client/src/view/widgets/action_bar.dart';
import 'package:oon_client/src/view/remove/page_logo.dart';
import 'package:oon_client/src/view_models/sender/AddSender_viewmodel.dart';
import 'package:oon_client/src/view_models/sender/SendPay_veiwmodel.dart';
import 'package:oon_client/src/view_models/order_history_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SendPay extends StatefulWidget {
  final String price;
  const SendPay({
    Key key,
    this.colorPattern,
    this.model,
    this.price,
  }) : super(key: key);

  final ColorPattern colorPattern;
  final OrderHistoryViewModel model;
  @override
  _SendPayState createState() => _SendPayState();
}

class _SendPayState extends State<SendPay> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenwidth = MediaQuery.of(context).size.width;
    return ViewModelBuilder.reactive(
      builder: (BuildContext context, SendPayViewModel model, Widget child) {
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
                  Text(
                    "7",
                    style: TextStyle(
                      fontSize: 35,
                      color: model.colorPattern.primaryColor,
                    ),
                  )
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
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: screenwidth / 2,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color(0xFFF1F2F2),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: GestureDetector(
                        onTap: () {
                          // model.orderStatus = OrderStatus2.Completed;
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          color: model.orderStatus == OrderStatus2.Completed
                              ? Color(0xFFD0DD28)
                              : Colors.white,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      width: screenwidth / 2,
                      height: 40,
                      child: GestureDetector(
                        onTap: () {
                          model.orderStatus = OrderStatus3.Inprogress;
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          color: model.orderStatus == OrderStatus3.Inprogress
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
                        Text('${widget.price} AED')
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
                        Text('${widget.price} AED')
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
              onPressed: () async {
                model.sendOrder(context);
              },
              child: model.getIsLoading == true
                  ? spickit
                  : Text('تنفيذ الطلب', style: TextStyle(fontSize: 20)),
              color: Color(0xFFD0DD28),
              textColor: Colors.white,
              elevation: 5,
            ),
          ),
        );
      },
      viewModelBuilder: () => SendPayViewModel(),
    );
  }

  var spickit = SpinKitWave(
    size: 35,
    color: Colors.white,
  );
}
