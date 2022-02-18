import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oon_client/logic/app/components/drawer_widget.dart';
import 'package:oon_client/logic/app/controllers/home_controller.dart';
import 'package:oon_client/src/view/remove/page_logo.dart';
import 'package:oon_client/src/view/widgets/action_bar.dart';
import 'package:oon_client/src/view/widgets/m_button.dart';

class SelectLocationsReceviceScreen extends GetView<HomeController> {
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
      ),
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
                  'مكان الاستلام',
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
                            onPress: controller.setLocationRecevice,
                            label: ' تحديد الموقع',
                            color: controller.colorPattern.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
      endDrawer: drawerCustom(),
    );
  }
}
