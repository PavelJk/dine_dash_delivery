import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/transactions/widgets/transac_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentMethodEmpty extends StatelessWidget {
  final String isCard;
  final String cardNumber;

  const PaymentMethodEmpty({super.key, required this.isCard, required this.cardNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransactionsAppBar(
        text: 'Способ оплаты',
        onTap: () {
          context.goNamed(AppRoute.mainHome.name);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: isCard == 'true' ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            isCard == 'true' ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                color: Color(0xffF4F5F7),
                margin: EdgeInsets.all(0),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Мир', style: Theme.of(context).textTheme.bodyMedium,),
                      Row(
                        children: [
                          Image.asset(
                            PathImages.logoBank,
                          ),
                          SizedBox(width: 2,),
                          Text('*************', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Color.fromARGB(255, 175, 175, 175),
                            fontWeight: FontWeight.w400
                          ),),
                          SizedBox(width: 5,),
                          Text(cardNumber.substring(cardNumber.length - 3), style: TextStyle(fontSize: 16),)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
            : 
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
                  onPressed: (){
                    context.goNamed(
                      AppRoute.addCardPayment.name,
                      pathParameters:{
                      "ismethod" : 'false',
                      "totalAmount" : '5555',
                    }
                    );  
                  },
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