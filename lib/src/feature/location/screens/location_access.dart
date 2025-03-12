import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LocationAccess extends StatelessWidget {
  const LocationAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                PathImages.geoLocation,
              ),
               SizedBox(height: 100,),
              CustomButtonWidget(
                onPressed: (){
                  context.goNamed(AppRoute.map.name);
                },
                text: 'УКАЗАТЬ МЕСТОПОЛОЖЕНИЕ',
                isImagesText: true,
                assetName: PathImages.mapPin,
              ),
              SizedBox(height: 9,),
              TextButton(
                onPressed: (){
                  context.goNamed(AppRoute.mainHome.name);
                },
                style: TextButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                ),
                child: Text(
                  'Пропустить',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xffAAAAAA),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13),
                child: Text(
                  textAlign: TextAlign.center,
                    'Пообедать Даш получит доступ к вашему местоположению только во время использования приложения',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff646982),
                      fontWeight: FontWeight.w400
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}