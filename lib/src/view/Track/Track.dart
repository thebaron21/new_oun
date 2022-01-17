import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oon_client/src/helpers/color_pattern.dart';
import 'package:oon_client/src/services/order_serivce.dart';
import 'package:oon_client/src/services/repositories/order_repository.dart';
import 'package:oon_client/src/view_models/Track/Track_viewmodel.dart';
import 'package:oon_client/src/view_models/order_history_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';

import 'TrackInfo.dart';

class Track extends StatefulWidget {
  const Track({
    Key key,
    this.colorPattern,
    this.model,
  }) : super(key: key);

  final ColorPattern colorPattern;
  final OrderHistoryViewModel model;
  @override
  _TrackState createState() => _TrackState();
}

class _TrackState extends State<Track> {
  OrderService orderService = OrderService();
  String token;
  init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      token = sharedPreferences.getString("token");
    });
    print("");
  }

  @override
  void initState() {
    super.initState();
    init();
  }

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
      builder: (BuildContext context, TrackViewModel model, Widget child) {
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
          body: FutureBuilder<OrderRepository>(
            future: orderService.fetchOrder(token: token),
            // ignore: missing_return
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //   content: Text("خطأ غير معروف"),
                    // ));
                    return Center(child: spickit);
                    break;
                  case ConnectionState.waiting:
                    return Center(child: spickit);
                    break;
                  case ConnectionState.active:
                    return Center(child: spickit);
                    break;
                  case ConnectionState.done:
                    return ListView(
                      children: [
                        Container(
                          width: screenwidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              tabBar(
                                screenwidth,
                                image: 'assets/images/svg/ic_completed.svg',
                                txt: 'مكتمل',
                                onTap: () {
                                  model.orderStatus = OrderStatus4.Completed;
                                },
                                color:
                                    model.orderStatus4 == OrderStatus4.Completed
                                        ? Color(0xFFD0DD28)
                                        : Colors.white,
                                colorImage:
                                    model.orderStatus4 == OrderStatus4.Completed
                                        ? Colors.white
                                        : Color(0xFFD0DD28),
                              ),
                              tabBar(
                                screenwidth,
                                image: 'assets/images/svg/ic_inprogress.svg',
                                txt: 'قيد التنفيذ',
                                onTap: () {
                                  model.orderStatus = OrderStatus4.Inprogress;
                                },
                                color: model.orderStatus4 ==
                                        OrderStatus4.Inprogress
                                    ? Color(0xFFD0DD28)
                                    : Colors.white,
                                colorImage: model.orderStatus4 ==
                                        OrderStatus4.Inprogress
                                    ? Colors.white
                                    : Color(0xFFD0DD28),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        ),
                        Container(
                          width: screenwidth,
                          height: screenhigh,
                          child: _mapList(snapshot.data.orders,
                              model.orderStatus4, screenwidth),
                        ),
                      ],
                    );
                    break;
                }
              } else if (snapshot.hasError) {
                print("Error");
                return Container(
                  width: 500,
                  height: 500,
                  child: Center(
                    child: snapshot.data.error == null
                        ? spickit
                        : Text("snapshot.data.error"),
                  ),
                );
              } else {
                return Center(
                  child: Text("لا توجد طلبات"),
                );
              }
            },
          ),
        );
      },
      viewModelBuilder: () => TrackViewModel(),
    );
  }

  _buildListTile(OrderFetchModel model, screenwidth) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TrackInfo(
              model: model,
            ),
          ),
        );
      },
      child: Container(
        width: screenwidth,
        alignment: Alignment.center,
        child: Row(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(30, 0, 0, 0)),
            Column(
              children: [Text('<')],
            ),
            Padding(padding: EdgeInsets.fromLTRB(170, 0, 0, 0)),
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
                            Padding(padding: EdgeInsets.all(5)),
                            Text(
                              model.trackingCode, //'5345345435'
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.all(5)),
                            Text(model.nameRecive //'إسم المستلم',
                                ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.all(5)),
                            Text(
                              'غير مكتمل',
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.all(5)),
                            Text(
                              ':رقم التتبع',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.all(5)),
                            Text(
                              'إلى',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.all(5)),
                            Text(
                              'الحالة',
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  tabBar(screenwidth,
      {Function onTap,
      Color colorImage,
      Color color,
      String txt,
      String image}) {
    return Container(
      width: screenwidth / 2,
      height: 40,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(8),
          color: color,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(txt),
                SvgPicture.asset(
                  image,
                  semanticsLabel: 'Acme Logo',
                  color: colorImage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _mapList(List<OrderFetchModel> order, OrderStatus4 state, screenwidth) {
    List<OrderFetchModel> orders = [];
    if (state == OrderStatus4.Completed) {
      orders.addAll(order.where((element) => element.orderStatusId == "0"));
    } else if (state == OrderStatus4.Inprogress) {
      orders.addAll(order.where((element) => element.orderStatusId == "1"));
    }
    print("Length : " + order.length.toString());
    print("Length 5 : " + orders.length.toString());
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: orders.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildListTile(orders[index], screenwidth);
      },
    );
  }

  var spickit = SpinKitWave(
    size: 35,
    color: Color(0xFFD0DD28),
  );
}
