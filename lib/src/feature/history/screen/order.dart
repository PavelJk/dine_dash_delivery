import 'package:flutter/material.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои заказы'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Текущие'),
            Tab(text: 'История'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Вкладка "Текущие заказы"
          _buildActiveOrders(),
          // Вкладка "История заказов"
          _buildOrderHistory(),
        ],
      ),
    );
  }

  Widget _buildActiveOrders() {
    final orders = [
      _OrderItem(
        id: '#162432',
        title: 'Пиццерия Милано',
        price: '2220 руб.',
        status: null,
        date: null,
        buttons: ['Отследить', 'Отменить'],
      ),
      _OrderItem(
        id: '#242432',
        title: 'Вкусно-И Точка',
        price: '1130 руб.',
        status: null,
        date: null,
        buttons: ['Отследить', 'Отменить'],
      ),
      _OrderItem(
        id: '#240112',
        title: 'Кофе Вилль',
        price: '200 руб.',
        status: null,
        date: null,
        buttons: ['Отследить', 'Отменить'],
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) => _buildOrderCard(orders[index]),
    );
  }

  Widget _buildOrderHistory() {
    final orders = [
      _OrderItem(
        id: '#162432',
        title: 'Пиццерия Милано',
        price: '2220 руб.',
        status: 'Завершен',
        date: '29 янв., 12:30',
        buttons: ['Оценить', 'Повторить'],
      ),
      _OrderItem(
        id: '#242432',
        title: 'Вкусно-И Точка',
        price: '1130 руб.',
        status: 'Завершен',
        date: '30 янв., 12:30',
        buttons: ['Оценить', 'Повторить'],
      ),
      _OrderItem(
        id: '#240112',
        title: 'Кофе Вилль',
        price: '200 руб.',
        status: 'Отменен',
        date: '30 янв., 12:30',
        buttons: ['Оценить', 'Повторить'],
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) => _buildOrderCard(orders[index]),
    );
  }

  Widget _buildOrderCard(_OrderItem order) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  order.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (order.status != null)
                  Text(
                    order.status!,
                    style: TextStyle(
                      color: order.status == 'Отменен' ? Colors.red : Colors.green,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              order.price,
              style: const TextStyle(fontSize: 14),
            ),
            if (order.date != null) ...[
              const SizedBox(height: 8),
              Text(
                order.date!,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
            const SizedBox(height: 8),
            Text(
              order.id,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: order.buttons
                  .map((button) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: OutlinedButton(
                            onPressed: () {
                              // Обработка нажатия кнопки
                            },
                            child: Text(button),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItem {
  final String id;
  final String title;
  final String price;
  final String? status;
  final String? date;
  final List<String> buttons;

  _OrderItem({
    required this.id,
    required this.title,
    required this.price,
    this.status,
    this.date,
    required this.buttons,
  });
}