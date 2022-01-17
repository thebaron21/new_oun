import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../widgets/action_bar.dart';
import '../../view_models/Recive/ReciveLocate_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ReciveLocate extends StatefulWidget {
  @override
  _ReciveLocateState createState() => _ReciveLocateState();
}

class _ReciveLocateState extends State<ReciveLocate> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder.reactive(
        builder:
            (BuildContext context, ReciveLocateViewModel model, Widget child) {
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
                  Expanded(
                    child: Container(
                      width: size.width,
                      child: GoogleMap(
                        polylines: model.mapsPolyline.toSet(),
                        markers: model.mapsMarker.toSet(),
                        onTap: (value) {
                          model.selectPosition(value);
                        },
                        myLocationEnabled: true,
                        mapType: MapType.normal,
                        initialCameraPosition: model.cameraPosition,
                        onMapCreated: (con) {
                          model.changeCompleter(con);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniStartFloat,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Color(0xFFD0DD28),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              child: Icon(Icons.arrow_forward_ios),
              onPressed: () => model.nextPage(context),
            ),
          );
        },
        viewModelBuilder: () => ReciveLocateViewModel());
  }
}
