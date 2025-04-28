import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatefulWidget {
  final double totalAmount;

  const PaymentMethodScreen({Key? key, required this.totalAmount}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int _selectedMethodIndex = 2; 
  final String _maskedCardNumber = '**** 436'; 
  final List<PaymentMethod> _paymentMethods = [
    PaymentMethod(name: 'Кошелек', icon: Icons.account_balance_wallet),
    PaymentMethod(name: 'СБП', icon: Icons.phone_android),
    PaymentMethod(name: 'МИР', icon: Icons.credit_card),
    PaymentMethod(name: 'ЮMoney', icon: Icons.account_balance),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Оплата'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                const SizedBox(height: 8),
                ..._paymentMethods.asMap().entries.map((entry) {
                  final index = entry.key;
                  final method = entry.value;
                  return _buildPaymentMethodTile(method, index);
                }).toList(),
                if (_selectedMethodIndex == 2) _buildAddCardButton(),
                const Divider(height: 32),
              ],
            ),
          ),
          
          _buildPaymentSummary(),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodTile(PaymentMethod method, int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: RadioListTile<int>(
        value: index,
        groupValue: _selectedMethodIndex,
        onChanged: (value) => setState(() => _selectedMethodIndex = value!),
        title: Row(
          children: [
            Icon(method.icon, color: Colors.orange),
            const SizedBox(width: 12),
            Text(method.name),
            if (index == 2) const Spacer(), // For MIR card number
            if (index == 2) Text(
              _maskedCardNumber,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
        activeColor: Colors.orange,
      ),
    );
  }

  Widget _buildAddCardButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 16),
      child: TextButton.icon(
        icon: const Icon(Icons.add, color: Colors.orange),
        label: const Text(
          'ДОБАВИТЬ КАРТУ',
          style: TextStyle(color: Colors.orange),
        ),
        onPressed: _addNewCard,
      ),
    );
  }

  Widget _buildPaymentSummary() {
    return Container(
      padding: const EdgeInsets.all(16),
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '${widget.totalAmount.toStringAsFixed(0)} р.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange.shade800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _processPayment,
              child: const Text(
                'ОПЛАТИТЬ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addNewCard() {
    // Implement card adding logic
    print('Add new card flow');
  }

  void _processPayment() {
    final method = _paymentMethods[_selectedMethodIndex].name;
    print('Processing payment with $method');
    // Implement payment processing
  }
}

class PaymentMethod {
  final String name;
  final IconData icon;

  PaymentMethod({required this.name, required this.icon});
}