import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/auth/widgets/appbar_widget.dart';
import 'package:dine_dash_delivery/src/feature/location/widgets/button_widget.dart';
import 'package:dine_dash_delivery/src/feature/location/widgets/text_field_widget.dart';
import 'package:dine_dash_delivery/src/feature/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  //final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  bool _isPanelOpen = false;
  BuildingType? _selectedBuilding;


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
          !_isPanelOpen ? Positioned(
            bottom: 150,
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
          ) : SizedBox.shrink(),
          SlidingUpPanel(
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
            panel: Builder(
              builder: (context) {
                final content = Padding(
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
                      SizedBox(height: 13,),
                      Row(
                        children: [
                          Expanded(
                            child: MyLocationTextField(
                              text: 'КВ/ОФИС',
                            ),
                          ),
                          SizedBox(width: 12,),
                          Expanded(
                            child: MyLocationTextField(
                              text: 'ПОДЪЕЗД'
                            )
                          ),
                        ],
                      ),
                      SizedBox(height: 13,),
                      Row(
                        children: [
                          Expanded(
                            child: MyLocationTextField(
                              text: 'ЭТАЖ',
                            ),
                          ),
                          
                          SizedBox(width: 12,),
                          Expanded(
                            child: MyLocationTextField(
                              text: 'ДОМОФОН'
                            )
                          ),
                        ],
                      ),
                      SizedBox(height: 13,),
                      Text(
                        'ТИП ЗДАНИЯ',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: 7,),
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
                      SizedBox(height: 28,),
                      MyCustomButtonWidget(
                        onPressed: (){
                  
                        }, 
                        text: 'СОХРАНИТЬ АДРЕС'
                      ),
                    ],
                  ),
                );
                return _isPanelOpen ? CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      primary: false,
                      scrolledUnderElevation: 0,
                      toolbarHeight: 27,
                      flexibleSpace: MaAppBarSlidingUpPanel(),
                    ),
                    SliverToBoxAdapter(
                      child: content,
                    ),
                  ],
                ) : Column(
                  children: [
                    MaAppBarSlidingUpPanel(),
                    SizedBox(height: 20,),
                    content,
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

class MaAppBarSlidingUpPanel extends StatelessWidget {
  const MaAppBarSlidingUpPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: 70,
          height: 7,
          decoration: BoxDecoration(
          color: Color(0xffD8E3ED),
          borderRadius: BorderRadius.circular(80)
        ),
      ),
    );
  }
}