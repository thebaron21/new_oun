import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oon_client/src/view/remove/page_logo.dart';
import 'package:oon_client/src/view/sender/SendLocate.dart';
import 'package:oon_client/src/view/widgets/action_bar.dart';
import 'package:oon_client/src/view/widgets/m_button.dart';
import 'package:oon_client/src/view_models/sender/order_step_one_viewmodel.dart';
import '../remove/ReciveLocate.dart';
import 'package:stacked/stacked.dart';

class SelectLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder:
          (BuildContext context, OrderStepOneViewModel model, Widget child) {
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
            body: SafeArea(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      imagePath: 'assets/images/svg/ic_step1.svg',
                      height: 60,
                    ),
                    Center(
                      child: Text(
                        'مكان الاستلام',
                        style: TextStyle(
                            color: model.colorPattern.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                    Expanded( 
                        child: Container(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                              child: Center(
                                child: MButton(
                                  onPress: () {
                                    model.location(context);
                                  },
                                  label: ' تحديد الموقع',
                                  color: model.colorPattern.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          // Positioned(
                          //   top: 180,
                          //   child: Container(
                          //     child: Center(
                          //       child: PageLogo(
                          //         imagePath:
                          //             'assets/images/svg/ic_location.svg',
                          //         height: 60,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ));
      },
      viewModelBuilder: () => OrderStepOneViewModel(),
    );
  }
}
