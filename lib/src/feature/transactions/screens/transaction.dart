import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/auth/widgets/text_field.dart';
import 'package:dine_dash_delivery/src/feature/transactions/widgets/transac_app_bar.dart';
import 'package:dine_dash_delivery/src/feature/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentMethodScreen extends StatefulWidget {
  final String totalAmount;
  final String isCard;
  final String cardNumber;

  const PaymentMethodScreen({
    super.key, 
    required this.totalAmount, 
    required this.isCard, 
    required this.cardNumber
  });

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int _selectedMethodIndex = 1;
  String mir = 'Мир';
  final List<PaymentMethod> _paymentMethods = [
    PaymentMethod(name: 'СБП', icon: 'https://img.logodad.com/upload/S/BFR/sbp-Symbol-icon.png'),
    PaymentMethod(name: 'Мир', icon: 'https://toplogos.ru/images/logo-mir.png'),
    PaymentMethod(name: 'ЮMoney', icon: 'https://static.insales-cdn.com/files/1/19/20037651/original/_.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransactionsAppBar(
        text: 'Оплата',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Горизонтальный список методов оплаты
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: _paymentMethods.length,
              itemBuilder: (context, index) {
                final method = _paymentMethods[index];
                return _buildPaymentMethodTile(method, index);
              },
            ),
          ),
          
          // Блок с картой (если выбран МИР)
          if (mir == 'Мир') 
            Expanded(child: _buildAddCardButton()),
          
          // Итоговая сумма и кнопка оплаты
          _buildPaymentSummary(),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodTile(PaymentMethod method, int index) {
    return GestureDetector(
      onTap: () {
        setState(() => _selectedMethodIndex = index);
        setState(() => mir = method.name);
      },
      child: Stack(
        children:[ 
          Padding(
            padding: const EdgeInsets.only(top: 6, right: 8, left: 8),
            child: Column(
              children: [
                Container(
                width: 93,
                height: 80,
                decoration: BoxDecoration(
                  color: _selectedMethodIndex == index 
                    ? Colors.white 
                    : Color(0xffF0F5FA),
                  borderRadius: BorderRadius.circular(12),
                  border: _selectedMethodIndex == index
                    ? Border.all(color: Theme.of(context).colorScheme.tertiary, width: 2)
                    : Border.all(color: Colors.grey.shade200),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Image.network(
                    method.icon,
                  ),
                ),
               ),
                const SizedBox(height: 8),
                Text(
                  method.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        _selectedMethodIndex == index ?
        Positioned(
          right: 1,
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            radius: 12,
            child: Icon(
              Icons.check,
              size: 15,
            ),
          ),
        ): SizedBox.shrink()
        ]
      ),
    );
  }

  Widget _buildAddCardButton() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: widget.isCard == 'true' ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            widget.isCard == 'true' 
              ? Card(
                color: const Color(0xffF4F5F7),
                margin: EdgeInsets.zero,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Мир', style: Theme.of(context).textTheme.bodyMedium),
                      Row(
                        children: [
                          Image.asset(PathImages.logoBank),
                          const SizedBox(width: 2),
                          Text(
                            '*************', 
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: const Color.fromARGB(255, 175, 175, 175),
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            widget.cardNumber.substring(widget.cardNumber.length - 3), 
                            style: const TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
              : Card(
                  color: const Color(0xffF7F8F9),
                  margin: EdgeInsets.zero,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        PathImages.cardTrans,
                        width: 200,
                      ),
                      const SizedBox(height: 25),
                      Text(
                        'Нет карт',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        textAlign: TextAlign.center,
                        'Вы можете добавить карту и сохранить ее на потом',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: const Color(0xff2D2D2D)
                        ),
                      ),
                    ],
                  ),
                ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.add, size: 20),
                label: const Text(
                  'ДОБАВИТЬ КАРТУ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () => context.goNamed(
                  AppRoute.addCardPayment.name,
                  pathParameters:{
                    "ismethod" : 'true',
                    "totalAmount" : widget.totalAmount,
                  }
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: BorderSide(
                    color: const Color(0xff898989),
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentSummary() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'ОБЩАЯ ЦЕНА:',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffA0A5BA),
              ),),
              Text(
                '${widget.totalAmount} р.',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 25),
              ),
            ],
          ),
          const SizedBox(height: 16),
          MyCustomMainButton(
            text: 'ОПЛАТИТЬ', 
            onPressed: _processPayment,
          ),
        ],
      ),
    );
  }

  void _processPayment() {
    final method = _paymentMethods[_selectedMethodIndex].name;
    print('Processing payment with $method');
    context.goNamed(AppRoute.paymentSecefulScreen.name);
    // Implement payment processing
  }
}

class PaymentMethod {
  final String name;
  final String icon;

  PaymentMethod({required this.name, required this.icon});
}