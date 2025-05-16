import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(right: 24, left: 24, bottom: 24, top: 250),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              PathImages.successIllustation
            ),
            SizedBox(height: 30),
            Text(
              'Поздравляем!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'Вы успешно осуществили платеж, наслаждайтесь нашим сервисом!',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 141, 145, 149),
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            MyCustomMainButton(
              onPressed: (){
                context.goNamed(AppRoute.mainHome.name);
              },
              text: 'ПЕРЕЙТИ К ОТСЛЕЖИВАНИЮ'
            ),
          ],
        ),
      ),
    );
  }
}