import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oon_client/src/services/repositories/order_repository.dart';
import 'package:oon_client/src/view_models/Track/TrackInfo_viewmodel.dart';

import 'package:stacked/stacked.dart';

class TrackInfo extends StatefulWidget {
  final OrderFetchModel model;

  const TrackInfo({Key key, this.model}) : super(key: key);
  @override
  _TrackInfoState createState() => _TrackInfoState();
}

class _TrackInfoState extends State<TrackInfo> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
//360
    double screenhigh = MediaQuery.of(context).size.height;

    double A;
    double B;
    double C;

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      A = screenwidth / 1.2;
      B = screenwidth / 1.44;
      C = screenwidth / 2.11;
    } else {
      A = screenwidth / 1.2;

      B = screenwidth / 1.44;
      C = screenwidth / 2.11;
    }

    return ViewModelBuilder.reactive(
        builder:
            (BuildContext context, TrackInfoViewModel model, Widget child) {
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
            body: ListView(children: [
              Container(
                height: 100,
                width: screenwidth,
                color: Color(0xFFD0DD28),
              ),
              Stack(
                children: [
                  Container(
                    height: screenhigh / 4,
                    width: screenwidth,
                    color: Color(0xFFD0DD28),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: screenhigh / 2,
                          width: screenwidth - 50,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(padding: EdgeInsets.all(10)),
                                  Text(widget
                                          .model.trackingCode //'4543545535435',
                                      ),
                                  Padding(padding: EdgeInsets.all(10)),
                                  Text(
                                    ':رقم التتبع',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.qr_code)
                                ],
                              ),
                              Padding(padding: EdgeInsets.all(10)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(padding: EdgeInsets.all(10)),
                                  Padding(padding: EdgeInsets.all(10)),
                                  Text(
                                    ':موقع الإستلام',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.location_pin)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 20,
                                    ),
                                    child: Text(
                                      widget.model.area.substring(0, 30),
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                              Padding(padding: EdgeInsets.all(10)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(padding: EdgeInsets.all(10)),
                                          Text(
                                            ':موعد الإستلام',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Icon(Icons.timelapse_sharp)
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            widget.model.deliveryTime
                                                .substring(10, 15),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(padding: EdgeInsets.all(10)),
                                          Text(
                                            ':تاريخ الإستلام',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Icon(Icons.calendar_today)
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              widget.model.date.length > 10
                                                  ? widget.model.date
                                                      .substring(0, 10)
                                                  : widget.model.date,
                                              style: TextStyle(fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Padding(padding: EdgeInsets.all(10)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(padding: EdgeInsets.all(10)),
                                  Padding(padding: EdgeInsets.all(10)),
                                  Text(
                                    ':إلى',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.person)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.model.nameRecive,
                                  )
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: screenwidth - 50,
                        child: RaisedButton(
                          onPressed: () async {},
                          child: const Text('سجل الطلب',
                              style: TextStyle(fontSize: 20)),
                          color: Color(0xFFD0DD28),
                          textColor: Colors.white,
                          elevation: 5,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(padding: EdgeInsets.fromLTRB(20, 105, 20, 0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: screenwidth,
                        child: RaisedButton(
                          onPressed: () {},
                          child: const Text('الإبلاغ عن مشكلة',
                              style: TextStyle(fontSize: 20)),
                          color: Color(0xFFD0DD28),
                          textColor: Colors.white,
                          elevation: 5,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ]),
          );
        },
        viewModelBuilder: () => TrackInfoViewModel());
  }
}
