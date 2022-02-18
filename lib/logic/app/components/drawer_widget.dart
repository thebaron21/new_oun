import 'package:flutter/material.dart';
import 'components_drawer.dart';


Widget drawerCustom() => Drawer(
      child: Container(
        color: Color(0xFF828385),
        child: Column(
          children:[
            SizedBox(height:50),
            ComponentDrawer.barInfoUser(),
            ComponentDrawer.divider(),
            ListView.separated(
              separatorBuilder: (context,i) => ComponentDrawer.dr(),
              itemCount: ComponentDrawer.itemsGet.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemBuilder: (context,int index){
                return ComponentDrawer.card(ComponentDrawer.itemsGet[index]);
              },
            )
          ]
        )
      ),
    );






