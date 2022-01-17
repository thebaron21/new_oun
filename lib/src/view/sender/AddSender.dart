import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oon_client/src/helpers/color_pattern.dart';
import 'package:oon_client/src/view/widgets/action_bar.dart';
import 'package:oon_client/src/view/remove/page_logo.dart';
import 'package:oon_client/src/view_models/sender/AddSender_viewmodel.dart';
import 'package:oon_client/src/view_models/order_history_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
//import 'package:contact_picker/contact_picker.dart';

class AddSender extends StatefulWidget {
  final String address;
  const AddSender({
    Key key,
    this.colorPattern,
    this.model,
    this.address,
  }) : super(key: key);

  final ColorPattern colorPattern;
  final OrderHistoryViewModel model;
  @override
  _AddSenderState createState() => _AddSenderState();
}

class _AddSenderState extends State<AddSender> {
  TextEditingController _phone = TextEditingController();
  TextEditingController _uae = TextEditingController();

  GlobalKey<FormState> _keyFrom = GlobalKey<FormState>();
 // ContactPicker _contactPicker = ContactPicker();

  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() async {
    SharedPreferences obj = await SharedPreferences.getInstance();
    obj.setBool("isSender", true);
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
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
//SendPackDetails
    return ViewModelBuilder.reactive(
      builder: (BuildContext context, AddSenderViewModel model, Widget child) {
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
          body: Form(
            key: _keyFrom,
            child: ListView(
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
                      "4",
                      style: TextStyle(
                        fontSize: 35,
                        color: model.colorPattern.primaryColor,
                      ),
                    )
                  ],
                ),
                Center(
                  child: Text(
                    'إضافة مرسل',
                    style: TextStyle(
                        color: model.colorPattern.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                  child: Text('إسم جهة الإتصال'),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: A,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: A,
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
                                  controller: _uae,
                                  cursorColor: model.colorPattern.primaryColor,
                                  textAlign: TextAlign.center,
                                  decoration: new InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () async {/*
                                      Contact contact =
                                          await _contactPicker.selectContact();
                                      if (contact != null) {
                                        setState(() {
                                          _uae.text = contact.fullName;
                                          _phone.text =
                                              contact.phoneNumber.number;
                                        });
                                        model.changeInitValue(
                                          contact.fullName,
                                          contact.phoneNumber.number,
                                        );
                                      }*/
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/png/TF.png',
                                          height: 30,
                                        ),
                                        Center(
                                          child: Text(
                                            '+',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                  child: Text('رقم جهة الإتصال'),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: A,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: A,
                                height: 30,
                                decoration: BoxDecoration(
                                  //borderRadius: BorderRadius.circular(10),
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
                                  controller: _phone,
                                  cursorColor: model.colorPattern.primaryColor,
                                  textAlign: TextAlign.center,
                                  decoration: new InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/images/png/TF.png',
                                          height: 30,
                                        ),
                                      ),
                                      Center(
                                          child: Icon(Icons.phone,
                                              color: Colors.white))
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(10)),
                Container(
                  width: 300,
                  height: 100,
                ),
              ],
            ),
          ),
          bottomSheet: Container(
            width: screenwidth,
            height: 40,
            child: RaisedButton(
              onPressed: () async {
                if (_uae.text == "" || _phone.text == "") {
                  showMessage(context);
                } else {
                  model.goToAddDetails(
                    context,
                    address: widget.address,
                    uae: _uae.text,
                    myPhone: _phone.text,
                  );
                }
              },
              child: const Text(
                'تفاصيل الشحنة',
                style: TextStyle(fontSize: 20),
              ),
              color: Color(0xFFD0DD28),
              textColor: Colors.white,
              elevation: 5,
            ),
          ),
        );
      },
      viewModelBuilder: () => AddSenderViewModel(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

 
    showMessage(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "تفاصيل الشحنة",
            textAlign: TextAlign.right,
          ),
          content: Text(
            "أكمل جميع الحقول",
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
