import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oon_client/src/view/widgets/action_bar.dart';
import 'package:oon_client/src/view/remove/page_logo.dart';
import 'package:oon_client/src/view_models/sender/SendTime_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

class SendTime extends StatefulWidget {
  String address;

  SendTime({Key key, @required this.address}) : super(key: key);
  @override
  _SendTimeState createState() => _SendTimeState();
}

class _SendTimeState extends State<SendTime> {
  String _dateSend = DateTime.utc(2000, 30, 2).toString();
  @override
  void initState() {
    super.initState();
    if (widget.address == null) {
      widget.address = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenwidth = MediaQuery.of(context).size.width;
    double screenhigh = MediaQuery.of(context).size.height;

    double C;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      C = screenwidth / 2.04;
    } else {
      C = screenwidth / 2.04;
    }

    double screenheight = MediaQuery.of(context).size.height;

    double A;
    double B;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      A = screenheight / 3.35;
      B = screenheight / 16;
    } else {
      A = screenwidth / 3.35;
      B = screenwidth / 16;
    }
    return ViewModelBuilder.reactive(
      builder: (BuildContext context, SendTimeViewModel model, Widget child) {
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
                    "6",
                    style: TextStyle(
                      fontSize: 35,
                      color: model.colorPattern.primaryColor,
                    ),
                  )
                ],
              ),
              Center(
                child: Text(
                  'مواعيد الإرسال',
                  style: TextStyle(
                      color: model.colorPattern.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
              Container(
                color: Color(0xFFF1F2F2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          widget.address,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            maxRadius: 10,
                            child: Image.asset(
                              'assets/images/png/g.png',
                              width: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Image.asset(
                'assets/images/png/Group2.png',
                height: 180,
              ),
              _buildCalender(),
              SizedBox(
                height: 30,
              ),
              //     _buildTimeAndDate(context, size),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Column(
              //           children: [
              //             Align(
              //               alignment: Alignment.bottomCenter,
              //               child: Container(
              //                 width: C,
              //                 child: RaisedButton(
              //                   onPressed: () {
              //                     Navigator.of(context).pop();
              //                   },
              //                   child: const Text('الرجوع',
              //                       style: TextStyle(fontSize: 20)),
              //                   color: Color(0xFF6D6F72),
              //                   textColor: Colors.white,
              //                   elevation: 5,
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //         Column(
              //           children: [
              //             Align(
              //               alignment: Alignment.bottomCenter,
              //               child: Container(
              //                 width: C,
              //                 child: RaisedButton(
              //                   onPressed: () async {
              //                     model.goToDetails(
              //                         context,
              //                         _dateSend == null
              //                             ? DateTime.now()
              //                             : _dateSend,
              //                         widget.address);
              //                   },
              //                   child: const Text('تأكيد',
              //                       style: TextStyle(fontSize: 20)),
              //                   color: Color(0xFFD0DD28),
              //                   textColor: Colors.white,
              //                   elevation: 5,
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ],
              //     )
              //   ],
              // ),
            ],
          ),
          bottomNavigationBar: Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: screenwidth / 2,
                          height: B,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('الرجوع',
                                style: TextStyle(fontSize: 20)),
                            color: Color(0xFF6D6F72),
                            textColor: Colors.white,
                            elevation: 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: screenwidth / 2,
                          height: B,
                          child: RaisedButton(
                            onPressed: () async {
                              model.goToDetails(
                                  context,
                                  _dateSend == null
                                      ? DateTime.now()
                                      : _dateSend,
                                  widget.address);
                            },
                            child: const Text(' تأكيد العنوان',
                                style: TextStyle(fontSize: 20)),
                            color: Color(0xFFD0DD28),
                            textColor: Colors.white,
                            elevation: 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        );
      },
      viewModelBuilder: () => SendTimeViewModel(),
    );
  }

  DateTime initData = DateTime(2021, 6, 22);
  _buildCalender() {
    return CalendarTimeline(
      initialDate: initData,
      firstDate: DateTime(2021, 1, 1),
      lastDate: DateTime(2050, 1, 1),
      onDateSelected: (value) {
        setState(() => initData = value);
        setState(() =>
            _dateSend = "${initData.year}/${initData.month}/${initData.day}");
        print(_dateSend);
      },
      showYears: true,
      leftMargin: 80,
      monthColor: Colors.blueGrey,
      dayColor: Color(0xFF6D6F72),
      activeBackgroundDayColor: Color(0xFFD0DD28),
      activeDayColor: Colors.white,
      dotsColor: Color(0xFFF1F2F2),
      // selectableDayPredicate: (date) => date.day != 24,
      // locale: 'ar',
    );
  }
}
