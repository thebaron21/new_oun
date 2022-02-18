import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oon_client/logic/app/models/drawer_items.dart';
import 'package:oon_client/logic/app/pages/Tracking/Track.dart';
import 'package:oon_client/logic/app/pages/home_screen.dart';
import 'package:oon_client/logic/core/config/config_url.dart';
import 'package:oon_client/src/helpers/color_pattern.dart';
import 'package:oon_client/src/view/Track/Track.dart';
import 'package:url_launcher/url_launcher.dart';

class ComponentDrawer {
  static ColorPattern colorPattern = ColorPattern();
  static GetStorage storage = GetStorage();
  DrawerItems items = DrawerItems();

  static List<DrawerModel> get itemsGet => DrawerItems.drawers;

  static Widget barInfoUser() {
    return Padding(
      padding: const EdgeInsets.only(left: 100, bottom: 10),
      child: Row(
        children: [
          Column(
            children: [
              Text("أهلا بك", style: DrawerItems.textStyle2),
              Text(
                storage.read("user")["user"]["name"].toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: colorPattern.grayColor,
                ),
              )
            ],
          ),
          SizedBox(width: 20),
          _imageUser(),
        ],
      ),
    );
  }

  static Widget _imageUser() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colorPattern.primaryColor,
        border: Border.all(
          width: 1,
          color: colorPattern.primaryColor,
        ),
        image: DecorationImage(
          image: NetworkImage(
            "https://img.freepik.com/free-vector/man-shows-gesture-great-idea_10045-637.jpg?size=338&ext=jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  static Widget divider() {
    return Divider(
      color: Colors.white,
      thickness: 1,
      indent: 1,
    );
  }

  static Widget card(DrawerModel itemsGet) {
    return InkWell(
      onTap: () => itemsGet.onTap(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListTile(
          title: Text(itemsGet.text, style: DrawerItems.textStyle),
          leading: itemsGet.icon,
        ),
      ),
    );
  }

  static dr() {
    return Container(
      width: Get.width,
      height: 1,
      color:Colors.black12,
    );
  }
}

ColorPattern colorPattern = ColorPattern();

class DrawerItems {
  static TextStyle textStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  static TextStyle textStyle2 = TextStyle(
    fontSize: 25,
    color: colorPattern.magicColor,
    fontWeight: FontWeight.w600,
  );

  static List<DrawerModel> drawers = [
    DrawerModel(
      text: "الرئسية",
      icon: Icon(Icons.home, color: colorPattern.magicColor),
      onTap: () {
        Get.to(HomeScreen());
      },
    ),
    DrawerModel(
      text: "طلباتي",
      icon: Icon(Icons.calendar_today_rounded, color: colorPattern.magicColor),
      onTap: () {
        Get.to( TrackScreen() );
      },
    ),
    DrawerModel(
      text: "أتصل بنا",
      icon:
          Icon(Icons.forward_to_inbox_outlined, color: colorPattern.magicColor),
      onTap: () {},
    ),
    DrawerModel(
      text: "سياسة الإستخدام",
      icon: Icon(Icons.policy, color: colorPattern.magicColor),
      onTap: () async {
        await launch(ConfigUrl.privacyPolicy);
      },
    ),
    DrawerModel(
      text: "الشروط و الأحكام",
      icon: Icon(Icons.rule, color: colorPattern.magicColor),
      onTap: () async {
        await launch(ConfigUrl.termsConditions);
      },
    ),
    DrawerModel(
      text: "شارك التطبيق",
      icon: Icon(Icons.share, color: colorPattern.magicColor),
      onTap: () {},
    ),
    DrawerModel(
      text: "من نحن",
      icon: Icon(Icons.info, color: colorPattern.magicColor),
      onTap: () {},
    ),
  ];
}
