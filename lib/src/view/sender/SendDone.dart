import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oon_client/src/view/remove/order_step_two_view.dart';
import 'package:oon_client/src/view/widgets/action_bar.dart';
import 'package:oon_client/src/view/remove/page_logo.dart';
import 'package:oon_client/src/view/widgets/home.dart';
import 'package:oon_client/src/view_models/Recive/ReciveDone_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SendDone extends StatefulWidget {
  String code;

  SendDone({Key key, this.code}) : super(key: key);
  @override
  _SendDoneState createState() => _SendDoneState();
}

class _SendDoneState extends State<SendDone> {
  @override
  void initState() {
    super.initState();
    if (widget.code == null) {
      widget.code = "000000000";
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        builder:
            (BuildContext context, ReciveDoneViewModel model, Widget child) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),
              backgroundColor: model.colorPattern.primaryColor,
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
                ActionBar(
                  title: 'إرسال',
                  colorPattern: model.colorPattern,
                  back: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Home()));
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
                      "8",
                      style: TextStyle(
                        fontSize: 35,
                        color: model.colorPattern.primaryColor,
                      ),
                    )
                  ],
                ),
                Center(
                  child: Text(
                    'تم تسجيل طلبك',
                    style: TextStyle(
                        color: model.colorPattern.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.code),
                    Padding(padding: EdgeInsets.all(5)),
                    Text('الرقم المرجعي لطلبك هو'),
                  ],
                )),
                Divider(
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 225, 0, 0),
                ),
                Container(
                    width: 250,
                    height: 280,
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F2F2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        ),
                        Text(
                          'هل تود تنفيذ طلب أخر؟',
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding:
                                    EdgeInsets.fromLTRB(100 / 10, 0, 0, 0)),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        model.goToTrack(context);
                                      },
                                      child: Container(
                                          width: 80,
                                          height: 80,
                                          child: CircleAvatar(
                                            backgroundColor: Color(0XFFD0DD28),
                                            child: Image.asset(
                                              'assets/images/png/track.png',
                                              height: 40,
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                                Row(
                                  children: [
                                    Text(
                                      'تتبع',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        color: Colors.black45,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(28, 0, 0, 0)),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        model.goToBuy(context);
                                      },
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        child: CircleAvatar(
                                          backgroundColor: Color(0XFFD0DD28),
                                          child: Container(
                                            height: 40,
                                            child: Image.asset(
                                              'assets/images/png/sale.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                                Row(
                                  children: [
                                    Text(
                                      'بيع',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          color: Colors.black45),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(28, 0, 0, 0)),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        model.goToRecive(context);
                                      },
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        child: CircleAvatar(
                                          backgroundColor: Color(0XFFD0DD28),
                                          child: Container(
                                            height: 40,
                                            child: Image.asset(
                                              'assets/images/png/rec.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                                Row(
                                  children: [
                                    Text(
                                      'إستلام',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        color: Colors.black45,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          );
        },
        viewModelBuilder: () => ReciveDoneViewModel());
  }
}
