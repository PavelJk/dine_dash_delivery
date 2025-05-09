import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/feature/transactions/widgets/transac_app_bar.dart';
import 'package:flutter/material.dart';

class PaymentMethodEmpty extends StatelessWidget {

  const PaymentMethodEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransactionsAppBar(
        text: 'Способ оплаты'
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Color(0xffF7F8F9),
              margin: EdgeInsets.all(0),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      PathImages.cardTrans, // Добавьте логотип МИР в ваши assets
                      width: 200,
                    ),
                    SizedBox(height: 25),
                    Text(
                      'Нет карт',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      textAlign: TextAlign.center,
                      'Вы можете добавить карту и сохранить ее на потом',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Color(0xff2D2D2D)
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                icon: const Icon(Icons.add, size: 20),
                label: const Text(
                  'ДОБАВИТЬ КАРТУ',
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: (){},
              style: OutlinedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                side: BorderSide(
                  color: Color(0xff898989),
                  width: 1.5,
                ),
              ),
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}