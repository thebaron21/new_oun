import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oon_client/src/view/remove/page_logo.dart';
import 'package:oon_client/src/view/widgets/action_bar.dart';
import 'package:oon_client/src/view/widgets/order_status_switch.dart';
import 'package:oon_client/src/view_models/order_history_viewmodel.dart';
import 'package:stacked/stacked.dart';

class OrderHistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        builder:
            (BuildContext context, OrderHistoryViewModel model, Widget child) {
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
              leading: Container(
                padding: EdgeInsets.all(8),
                child: SvgPicture.asset(
                  'assets/images/svg/ic_menu.svg',
                ),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ActionBar(
                        title: 'سجل الطلبات',
                        colorPattern: model.colorPattern,
                        back: () {},
                        help: () {},
                      ),
                      PageLogo(
                        imagePath: 'assets/images/svg/ic_order_history.svg',
                      ),
                      OrderStatusSwitch(
                          model: model, colorPattern: model.colorPattern),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0)),
                              Column(
                                children: [Text('<')],
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(170, 0, 0, 0)),
                              Column(
                                children: [
                                  Padding(padding: EdgeInsets.all(10)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.all(5)),
                                              Text(
                                                '5345345435',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.all(5)),
                                              Text(
                                                'إسم المستلم',
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.all(5)),
                                              Text(
                                                'تم الإلغاء',
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.all(5)),
                                              Text(
                                                ':رقم التتبع',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.all(5)),
                                              Text(
                                                'إلى',
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.all(5)),
                                              Text(
                                                'الحالة',
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ), /*
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 340,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    '7678576567567',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  Padding(padding: EdgeInsets.all(5)),
                                                  Text(
                                                    ':رقم التتبع',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text('إسم المستلم'),
                                                  Padding(padding: EdgeInsets.all(5)),
                                                  Text('إلى '),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text('تم الإلغاء'),
                                                  Padding(padding: EdgeInsets.all(5)),
                                                  Text('الحالة'),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),*/
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => OrderHistoryViewModel());
  }
}
