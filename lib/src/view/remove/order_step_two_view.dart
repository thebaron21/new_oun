import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oon_client/src/view/remove/page_logo.dart';
import 'package:oon_client/src/view/widgets/action_bar.dart';
import 'package:oon_client/src/view_models/order_step_two_viewmodel.dart';
import 'ReciveLocate.dart';
import 'package:stacked/stacked.dart';


class OrderStepTwoOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        builder:
            (BuildContext context, OrderStepTwoViewModel model, Widget child) {
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
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ActionBar(
                        title: 'إرسال',
                        colorPattern: model.colorPattern,
                        back: () {},
                        help: () {},
                      ),
                      PageLogo(
                        imagePath: 'assets/images/svg/ic_step2.svg',
                        height: 60,
                      ),
                      Column(
                        children: [
                          RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReciveLocate()),
                              );
                            },
                            child: const Text('تحديد الموقع',
                                style: TextStyle(fontSize: 20)),
                            color: Color(0xFFD0DD28),
                            textColor: Colors.white,
                            elevation: 5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        },
        viewModelBuilder: () => OrderStepTwoViewModel());
  }
}
