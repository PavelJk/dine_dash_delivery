import 'dart:async';

import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/auth/widgets/appbar_widget.dart';
import 'package:dine_dash_delivery/src/feature/location/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  //final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(56.631600, 47.886178),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppbarWidget(
        onTap: () {
          context.goNamed(AppRoute.locationAccess.name);
        },
        backgroundColor: Theme.of(context).colorScheme.secondary,
        iconColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _kGooglePlex,
            zoomControlsEnabled: false,
           /* onMapCreated: (controller) {
              _controller.complete(controller);
            },*/
          ),
          Positioned(
            bottom: 120,
            right: 12,
            child: GestureDetector(
              onTap: () {

              },
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                radius: 29,
                child: SvgPicture.asset(
                  PathImages.geolocator,
                ),
              ),
            ),
          ),
          SlidingUpPanel(
            padding: EdgeInsets.only(top: 6.5, right: 24, left: 24, bottom: 18),
            backdropEnabled: true,
            backdropColor: Theme.of(context).colorScheme.inversePrimary,
            minHeight: 140,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
            panel: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 70,
                    height: 7,
                    decoration: BoxDecoration(
                      color: Color(0xffD8E3ED),
                      borderRadius: BorderRadius.circular(80)
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  'АДРЕС ДОСТАВКИ',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 7,),
                MyTextFieldLocation()
              ],
            ),
          ),
        ]
      )
    );
  }
}