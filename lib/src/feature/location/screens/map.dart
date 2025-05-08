import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/auth/widgets/appbar.dart';
import 'package:dine_dash_delivery/src/feature/location/geolocator/get_location.dart';
import 'package:dine_dash_delivery/src/feature/location/widgets/button_widget.dart';
import 'package:dine_dash_delivery/src/feature/location/widgets/text_field_widget.dart';
import 'package:dine_dash_delivery/src/feature/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

enum BuildingType { home, work, other }

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  late GoogleMapController googleMapController;
  bool _isPanelOpen = false;
  Set<Marker> markers = {};
  BitmapDescriptor customMarker = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    addCustomMarker();
    super.initState();
  }

  void addCustomMarker() {
    BitmapDescriptor.asset(
      ImageConfiguration(), 
      PathImages.marker,
    ).then((icon){
      setState(() {
        customMarker = icon;
      });
    });
  }

  CameraPosition _kGooglePlex([double latitude = 56.631600, double longitude = 47.886178]) {
    return CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 14,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: MyAuthAndLocationAppbar(
          onTap: () {
            context.pop('value');
          },
          backgroundColor: Theme.of(context).colorScheme.secondary,
          iconColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Stack(children: [
          GoogleMap(                         // гугле карта
            myLocationButtonEnabled: false,
            initialCameraPosition: _kGooglePlex(),
            zoomControlsEnabled: false,
            onMapCreated: (controller) {
              googleMapController = controller;
            },
            markers: markers,
          ),
          !_isPanelOpen
              ? Positioned(                 // Кнопка геолокации
                  bottom: 150,
                  right: 12,
                  child: GestureDetector(
                    onTap: () async {
                      Position position = await getCurrentPosition();
                      googleMapController.animateCamera(CameraUpdate.newCameraPosition(
                        _kGooglePlex(position.latitude, position.longitude),
                      ));
                      markers.clear();
                      markers.add(
                        Marker(
                          markerId: MarkerId('MyLocationMarker'),
                          position: LatLng(position.latitude, position.longitude),
                          draggable: true,
                          onDragEnd: (value) {},
                          icon: customMarker,
                        ),
                      );
                      setState(() {});
                    },
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.tertiary,
                      radius: 29,
                      child: SvgPicture.asset(
                        PathImages.geolocator,
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),
          SlidingUpPanel(     // Нижняя выдвежная панель с контентом
              padding: EdgeInsets.only(top: 6.5, right: 24, left: 24, bottom: 16),
              backdropEnabled: true,
              backdropOpacity: 0.7,
              backdropColor: Theme.of(context).colorScheme.inversePrimary,
              minHeight: 140,
              maxHeight: MediaQuery.of(context).viewInsets.bottom > 0 ? 310 : 500,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24),
              ),
              onPanelSlide: (position) {
                setState(() {
                  _isPanelOpen = position > 0.03;
                });
              },
              onPanelOpened: () => setState(() => _isPanelOpen = true),
              onPanelClosed: () => setState(() => _isPanelOpen = false),
              panel: Builder(builder: (context) {
                return _isPanelOpen
                    ? CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            pinned: true,
                            primary: false,
                            scrolledUnderElevation: 0,
                            automaticallyImplyLeading: false,
                            toolbarHeight: 27,
                            flexibleSpace: MyAppBarSlidingUpPanel(),
                          ),
                          SliverToBoxAdapter(
                            child: ContentSlidingUpPanel(),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          MyAppBarSlidingUpPanel(),
                          SizedBox(
                            height: 20,
                          ),
                          ContentSlidingUpPanel(),
                        ],
                      );
              }
            )
          ),
        ]
      )
    );
  }
}

class MyAppBarSlidingUpPanel extends StatelessWidget {
  const MyAppBarSlidingUpPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 70,
        height: 7,
        decoration: BoxDecoration(
            color: Color(0xffD8E3ED), borderRadius: BorderRadius.circular(80)),
      ),
    );
  }
}



class ContentSlidingUpPanel extends StatefulWidget {
  const ContentSlidingUpPanel({super.key});

  @override
  State<ContentSlidingUpPanel> createState() => _ContentSlidingUpPanelState();
}

class _ContentSlidingUpPanelState extends State<ContentSlidingUpPanel> {

  BuildingType? _selectedBuilding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyLocationTextField(
            text: 'АДРЕС ДОСТАВКИ',
            prefixIcon: SvgPicture.asset(
              PathImages.location,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Row(
            children: [
              Expanded(
                child: MyLocationTextField(
                  text: 'КВ/ОФИС',
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(child: MyLocationTextField(text: 'ПОДЪЕЗД')),
            ],
          ),
          SizedBox(
            height: 13,
          ),
          Row(
            children: [
              Expanded(
                child: MyLocationTextField(
                  text: 'ЭТАЖ',
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(child: MyLocationTextField(text: 'ДОМОФОН')),
            ],
          ),
          SizedBox(
            height: 13,
          ),
          Text(
            'ТИП ЗДАНИЯ',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyTypeBuildingButton(
                onTap: () {
                  setState(() {
                    _selectedBuilding = _selectedBuilding == BuildingType.home
                        ? null
                        : BuildingType.home;
                  });
                },
                text: 'Дом',
                isCheckPressButton: _selectedBuilding == BuildingType.home,
              ),
              MyTypeBuildingButton(
                onTap: () {
                  setState(() {
                    _selectedBuilding = _selectedBuilding == BuildingType.work
                        ? null
                        : BuildingType.work;
                  });
                },
                text: 'Работа',
                isCheckPressButton: _selectedBuilding == BuildingType.work,
              ),
              MyTypeBuildingButton(
                onTap: () {
                  setState(() {
                    _selectedBuilding = _selectedBuilding == BuildingType.other
                        ? null
                        : BuildingType.other;
                  });
                },
                text: 'Другое',
                isCheckPressButton: _selectedBuilding == BuildingType.other,
              )
            ],
          ),
          SizedBox(
            height: 28,
          ),
          MyCustomMainButton(
            onPressed: () {
              context.goNamed(AppRoute.mainHome.name);
            }, 
          text: 'СОХРАНИТЬ АДРЕС'
        ),
        ],
      ),
    );
  }
}