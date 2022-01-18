import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oon_client/logic/core/config/config_url.dart';
import 'package:oon_client/src/helpers/color_pattern.dart';
import 'package:url_launcher/url_launcher.dart';

ColorPattern colorPattern = ColorPattern();
GetStorage storage = GetStorage();
Widget drawerCustom() => Drawer(
      child: Container(
        color: colorPattern.primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                    border: Border.all(
                      width: 2,
                      color: colorPattern.grayColor,
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://img.freepik.com/free-vector/man-shows-gesture-great-idea_10045-637.jpg?size=338&ext=jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    storage.read("user")["user"]["name"].toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: colorPattern.grayColor,
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () async {
                    await launch(ConfigUrl.privacyPolicy);
                  },
                  child: ListTile(
                    title: Text(
                      "سياسة الإستخدام",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await launch(ConfigUrl.termsConditions);
                  },
                  child: ListTile(
                    title: Text(
                      "الشروط و الأحكام",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
