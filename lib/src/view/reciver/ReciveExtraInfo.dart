import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oon_client/src/view/remove/page_logo.dart';
import 'package:oon_client/src/view/widgets/action_bar.dart';
import 'package:oon_client/src/view_models/Recive/ReciveExtraInfo_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class ReciveExtraInfo extends StatefulWidget {
  final String address;
  ReciveExtraInfo({Key key, this.address}) : super(key: key);
  @override
  _ReciveExtraInfoState createState() => _ReciveExtraInfoState();
}

class _ReciveExtraInfoState extends State<ReciveExtraInfo> {
  TextEditingController _details = TextEditingController();
  bool isAdd = false;
  String address = "";
  @override
  void initState() {
    super.initState();
    print(widget.address);
    if (widget.address != "") {
      if (widget.address.length >= 30) {
        setState(
          () => address = widget.address.substring(0, 30),
        );
      }
    } else if (widget.address == null) {
      setState(() => address = "not Location");
    }
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
      A = screenwidth / 1.44;
      B = screenhigh / 25.33;
      C = screenwidth / 2.04;
    } else {
      A = screenwidth / 1.44;
      B = screenhigh / 12;

      C = screenwidth / 2.04;
    }

    return ViewModelBuilder.reactive(
      builder:
          (BuildContext context, ReciveExtraInfoViewModel model, Widget child) {
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
          body: SingleChildScrollView(
            child: ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
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
                      '5',
                      style: TextStyle(fontSize: 45, color: Color(0xFFD0DD28)),
                    )
                  ],
                ),
                Center(
                  child: Text(
                    'تم تحديد الموقع بنجاح',
                    style: TextStyle(
                        color: model.colorPattern.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 75, 0, 0),
                ),
                Container(
                  color: Color(0xFFF1F2F2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            address,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 30,
                            alignment: Alignment.center,
                            child: CircleAvatar(
                                backgroundColor:
                                    model.colorPattern.primaryColor,
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                ),
                Container(
                  width: 200,
                  height: 280,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F2F2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      ),
                      Text(
                        'هل ترغب بإضافة تفاصيل إضافية للعنوان؟',
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      ),
                      Container(
                        width: A,
                        height: B,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2, 0),
                              color: Colors.grey,
                              spreadRadius: 0,
                              blurRadius: 2,
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: TextField(
                          controller: _details,
                          cursorColor: model.colorPattern.primaryColor,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              RaisedButton(
                                onPressed: () {
                                  setState(() => isAdd = true);
                                },
                                child: Text(
                                  'إلغاء',
                                  style: new TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(40),
                                ),
                                color: Color(0xFFD0DD28),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                          ),
                          Column(
                            children: [
                              RaisedButton(
                                onPressed: () async {
                                  if (_details.text == "") {
                                    showMessage(
                                      context,
                                      title: "تنبيه",
                                      content: "أكتب تفاصيل إضافية",
                                    );
                                  } else {
                                    showMessage(
                                      context,
                                      title: "إشعار",
                                      content: "تم حفظ تفاصيل العنوان",
                                    );
                                    print("Full Description " + _details.text);
                                  }
                                },
                                child: Text(
                                  'إضافة',
                                  style: new TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(40),
                                ),
                                color: Color(0xFFD0DD28),
                              ),
                            ],
                          )
                        ],
                      ),
                      Divider(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Text(
                                address,
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                    backgroundColor:
                                        model.colorPattern.primaryColor,
                                    child: Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(3)),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Column(
                      //       children: [
                      //         Text('160,20'),
                      //       ],
                      //     ),
                      //     Column(
                      //       children: [
                      //         Container(
                      //           margin: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                      //           alignment: Alignment.bottomRight,
                      //           child: CircleAvatar(
                      //               backgroundColor:
                      //                   model.colorPattern.primaryColor,
                      //               child: Icon(
                      //                 Icons.access_time_sharp,
                      //                 color: Colors.white,
                      //               )),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(height: 270),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
          bottomSheet: Container(
            height: 40,
            width: screenwidth,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('الرجوع', style: TextStyle(fontSize: 20)),
                    color: Color(0xFF6D6F72),
                    textColor: Colors.white,
                    elevation: 5,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                    onPressed: () async {
                      if (_details.text == "") {
                        showMessage(context,
                            title: "خطأ ", content: "يجب أكمل البيانات");
                      } else {
                        SharedPreferences obj =
                            await SharedPreferences.getInstance();
                        obj.setString("full_desc", _details.text);
                        model.goToBuy(context, widget.address);
                      }
                    },
                    child: const Text(' تأكيد العنوان',
                        style: TextStyle(fontSize: 20)),
                    color: Color(0xFFD0DD28),
                    textColor: Colors.white,
                    elevation: 5,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => ReciveExtraInfoViewModel(),
    );
  }

  showMessage(context, {String title, String content}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            textAlign: TextAlign.right,
          ),
          content: Text(
            content,
            textAlign: TextAlign.right,
          ),
          actions: [
            FlatButton(
              color: Color(0xFFD0DD28),
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("موفق"),
            )
          ],
        );
      },
    );
  }
}
