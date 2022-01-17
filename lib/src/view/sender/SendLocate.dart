import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oon_client/src/view/widgets/action_bar.dart';
import 'package:oon_client/src/view_models/sender/SendLocate_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SendLocate extends StatefulWidget {
  @override
  _SendLocateState createState() => _SendLocateState();
}

class _SendLocateState extends State<SendLocate> {
  @override
  void dispose() {
    super.dispose();
    SendLocateViewModel().dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder.reactive(
      builder: (BuildContext context, SendLocateViewModel model, Widget child) {
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
                      markers: model.mapsMarker.toSet(),
                      onTap: (value) {
                        model.selectPosition(value);
                      },
                      myLocationButtonEnabled: true,
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
          floatingActionButton: Row(
            children: [
              FloatingActionButton(
                heroTag: "btn1",
                backgroundColor: model.colorPattern.primaryColor,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                child: Icon(Icons.location_history),
                onPressed: () => model.LocationFunc(),
              ),
              SizedBox(width: 10),
              FloatingActionButton(
                heroTag: "btn2",
                backgroundColor: model.colorPattern.primaryColor,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                child: Icon(Icons.arrow_forward_ios),
                onPressed: () => model.nextPage(context),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => SendLocateViewModel(),
    );
  }
}
