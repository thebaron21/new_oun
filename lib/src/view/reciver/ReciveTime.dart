import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oon_client/src/view/widgets/action_bar.dart';
import 'package:oon_client/src/view/remove/page_logo.dart';
import 'package:oon_client/src/view_models/recive/ReciveTime_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ReciveTime extends StatefulWidget {
  String address;

  ReciveTime({Key key, @required this.address}) : super(key: key);
  @override
  _ReciveTimeState createState() => _ReciveTimeState();
}

class _ReciveTimeState extends State<ReciveTime> {
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
    return ViewModelBuilder.reactive(
      builder: (BuildContext context, ReciveTimeViewModel model, Widget child) {
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
                      '3',
                      style: TextStyle(fontSize: 45, color: Color(0xFFD0DD28)),
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
                Image.asset(
                  'assets/images/png/Group2.png',
                  height: 200,
                ),
                _buildCalender(),
                SizedBox(height: 150),
              ],
            ),
          ),
          bottomSheet: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: C,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'الرجوع',
                    style: TextStyle(fontSize: 20),
                  ),
                  color: Color(0xFF6D6F72),
                  textColor: Colors.white,
                  elevation: 5,
                ),
              ),
              Container(
                width: C,
                child: RaisedButton(
                  onPressed: () async {
                    model.goToSelectLocation(context,
                        _dateSend == null ? DateTime.now() : _dateSend);
                  },
                  child: const Text('تأكيد', style: TextStyle(fontSize: 20)),
                  color: Color(0xFFD0DD28),
                  textColor: Colors.white,
                  elevation: 5,
                ),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => ReciveTimeViewModel(),
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
      locale: 'en',
    );
  }
}
