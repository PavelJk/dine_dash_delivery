import 'package:flutter/material.dart';

class OrderTrackingCard extends StatelessWidget {
  const OrderTrackingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Пиццерия Милано',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Время доставки: 1 фев., 15:45',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const Divider(height: 24),
            const Center(
              child: Text(
                '20 МИН',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Center(
              child: Text(
                'ПРИМЕРНОЕ ВРЕМЯ ДОСТАВКИ',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildOrderStep('Ваш заказ принят', false),
            _buildOrderStep('Ваш заказ готовится', true),
            _buildOrderStep('Ваш заказ едет', false),
            _buildOrderStep('Заказ получен', false),
            const Divider(height: 24),
            const Text(
              'Дмитрий Ж. Курьер',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderStep(String title, bool isCompleted) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isCompleted ? Colors.green : Colors.grey,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: isCompleted ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}