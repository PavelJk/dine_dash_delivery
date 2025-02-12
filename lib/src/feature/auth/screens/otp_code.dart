import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/feature/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class OTPCode extends StatelessWidget {
  final String phoneNumber;

  const OTPCode({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Stack(
        children: [
          Positioned(
            child: Image.asset(
              PathImages.ellipseAuth,
            ),
          ),
          Positioned(
            right: 2,
            child: Image.asset(
              PathImages.vectorAuth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 118),
            child: Column(
              children: [
                Text(
                  "Введи код",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 10,),
                Text(
                  textAlign: TextAlign.center,
                  "Мы оправили код на ваш номер\n$phoneNumber",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 27,),
                Expanded(
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25)
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 130),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "КОД",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(height: 6,),
                            Spacer(),
                            CustomButtonWidget(
                              onPressed: (){

                              },
                            )
                          ],
                        ),
                      ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}