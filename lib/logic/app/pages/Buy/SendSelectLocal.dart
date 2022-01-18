import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oon_client/logic/app/components/drawer_widget.dart';
import 'package:oon_client/logic/app/controllers/home_controller.dart';
import 'package:oon_client/src/view/remove/page_logo.dart';
import 'package:oon_client/src/view/widgets/action_bar.dart';
import 'package:oon_client/src/view/widgets/m_button.dart';

class BuySelectLocationsScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          leading: Container(
            padding: EdgeInsets.all(8),
            child: SvgPicture.asset(
              'assets/images/svg/ic_menu.svg',
            ),
          ),
        ),
        endDrawer: drawerCustom(),
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ActionBar(
                  title: 'إرسال',
                  colorPattern: controller.colorPattern,
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
                    'مكان البيع',
                    style: TextStyle(
                        color: controller.colorPattern.primaryColor,
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
                              onPress: controller.selLocationBuy,
                              label: ' تحديد الموقع',
                              color: controller.colorPattern.primaryColor,
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
  }
}
