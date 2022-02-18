import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oon_client/logic/app/components/drawer_widget.dart';
import 'package:oon_client/logic/app/controllers/track_controller.dart';
import 'package:oon_client/logic/app/models/my_order.dart';

class TrackInfo extends GetView<TarckController> {
  final MyOrder model;

  TrackInfo(this.model);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
//360
    double screenheight = MediaQuery.of(context).size.height;

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

    return Scaffold(
      endDrawer: drawerCustom(),
      appBar: AppBar(
        backgroundColor: controller.colorPattern.primaryColor,
        centerTitle: true,
        title: Container(
          child: SvgPicture.asset(
            'assets/images/svg/ic_small_logo.svg',
            height: 40,
          ),
        ),
        leadingWidth: 48,
      ),
      body: ListView(
        children: [
          Container(
            height: 100,
            width: screenwidth,
            color: Color(0xFFD0DD28),
          ),
          Stack(
            children: [
              Container(
                height: screenheight / 4,
                width: screenwidth,
                color: Color(0xFFD0DD28),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: screenheight / 2,
                    width: screenwidth - 50,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(padding: EdgeInsets.all(10)),
                            Text(model.trackingCode //'4543545535435',
                                ),
                            Padding(padding: EdgeInsets.all(10)),
                            Text(
                              ':رقم التتبع',
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.location_pin)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 20,
                              ),
                              child: Text(
                                model.delivery.description,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(padding: EdgeInsets.all(10)),
                                    Text(
                                      ':موعد الإستلام',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(Icons.timelapse_sharp)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      DateFormat("yyyy-MM-dd kk:mm").format(DateTime.parse(model.delivery.deliveryTime)).toString(),
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
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(padding: EdgeInsets.all(10)),
                                    Text(
                                      ':تاريخ الإستلام',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(Icons.calendar_today)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        model.createdAt.length > 10
                                            ? model.createdAt.substring(0, 10)
                                            : model.createdAt,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.person)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                model.pickup.pickupContact,
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
              ),
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*

{
  id: 15,
  user_id: 8,
  action_type: Buy,
  total: 180.000000,
  pickup_total: 0.000000,
  tracking_code: 6209844758593,
  barcode: ,
  status: 1,
  agent: ,
  created_at: 2022-02-13T22:20:55.000000Z,
  updated_at: 2022-02-13T22:20:55.000000Z
 }

 */