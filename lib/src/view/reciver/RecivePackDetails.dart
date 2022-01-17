import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oon_client/src/view/widgets/action_bar.dart';
import 'package:oon_client/src/view/remove/page_logo.dart';
import 'package:oon_client/src/view_models/recive/RecivePackDetails_view_model.dart';
import 'package:stacked/stacked.dart';

class RecivePackDetails extends StatefulWidget {
  final String address;

  const RecivePackDetails({Key key, @required this.address}) : super(key: key);

  @override
  _RecivePackDetailsState createState() => _RecivePackDetailsState();
}

class _RecivePackDetailsState extends State<RecivePackDetails> {
  TextEditingController _details = TextEditingController();
  TextEditingController _price = TextEditingController();
  bool isBig = false;
  String token;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
//360
    double screenhigh = MediaQuery.of(context).size.height;

    double A;
    double B;
    double C;
    double D;
    double E;
    double F;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      A = screenwidth / 5.14;
      B = screenwidth / 7.2;
      C = screenwidth / 1.2;
      D = screenwidth / 12;
      E = screenwidth / 2.4;
      F = screenwidth / 1.8;
    } else {
      A = screenwidth / 5.14;
      B = screenwidth / 7.2;
      C = screenwidth / 1.2;
      D = screenwidth / 12 * 3;
      E = screenwidth / 2.4;
      F = screenwidth / 1.8;
    }
    return ViewModelBuilder.reactive(
      builder: (BuildContext context, RecivePackDetailsViewModel model,
          Widget child) {
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
              PageLogo(
                imagePath: 'assets/images/svg/ic_step2.svg',
                height: 60,
              ),
              Center(
                child: Text(
                  'تفاصيل الشحنة',
                  style: TextStyle(
                    color: model.colorPattern.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              // Container(
              //   color: Color(0xFFF1F2F2),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Column(
              //         children: [
              //           Text(widget.address //'الرياض,العليا,حديقةالعليا',
              //               ),
              //         ],
              //       ),
              //       Column(
              //         children: [
              //           Container(
              //             alignment: Alignment.center,
              //             child: CircleAvatar(
              //               maxRadius: 10,
              //               child: Image.asset(
              //                 'assets/images/png/g.png',
              //                 width: 30,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              Image.asset(
                'assets/images/png/gg.png',
              ),
              Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                child: Text('حجم الشحنة'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => setState(() => isBig = true),
                    child: _buildBig(A, isBig),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(D, 0, 0, 0)),
                  InkWell(
                    onTap: () => setState(() => isBig = false),
                    child: _buildSmail(B, isBig),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                    child: Text('تفاصيل محتوى الشحنة'),
                  ),
                  Container(
                    width: C,
                    height: 30,
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
                  Container(
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                    child: Text('أدخل قيمة الشحنة'),
                  ),
                  Container(
                    width: C,
                    height: 30,
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
                      controller: _price,
                      cursorColor: model.colorPattern.primaryColor,
                      textAlign: TextAlign.center,
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ],
          ),
          bottomSheet: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: screenwidth / 3,
                  height: E,
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
                Container(
                  width: screenwidth / 1.5,
                  height: E,
                  child: RaisedButton(
                    onPressed: () {
                      if (_details.text == "" || _price.text == "") {
                        showMessage(context,
                            title: "تنبيه", content: "أكمل البيانات");
                      } else {
                        model.goToTimeAndDate(context,
                            details: _details.text,
                            isBig: isBig,
                            price: _price.text,
                            address: widget.address);
                      }
                    },
                    child: const Text('مواعيد إرسال الشحنة',
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
      viewModelBuilder: () => RecivePackDetailsViewModel(),
    );
  }

  _buildBig(A, bool isSelect) {
    return Container(
      padding: EdgeInsets.all(5),
      color: isSelect == false ? null : Color(0xFFD0DD28).withOpacity(0.4),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    width: A,
                    child: Image.asset(
                      'assets/images/png/g5.png',
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(5)),
              Column(
                children: [
                  Row(
                    children: [
                      Text('كبير'),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '50*50*75cm 50kgm',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  _buildSmail(B, bool isSelect) {
    return Container(
      padding: EdgeInsets.only(top: 14, bottom: 14),
      color: isSelect == true ? null : Color(0xFFD0DD28).withOpacity(0.4),
      child: Column(
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
              Column(
                children: [
                  Container(
                    width: B,
                    child: Image.asset(
                      'assets/images/png/g4.png',
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(5)),
              Column(
                children: [
                  Row(
                    children: [
                      Text('صغير'),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '30*30*75cm 30kgm',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
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
