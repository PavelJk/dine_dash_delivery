import 'package:flutter/material.dart';

class StoreSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Доставка'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAddressSection(),
            SizedBox(height: 24),
            _buildSectionTitle('Популярные магазины'),
            _buildStoreList(popularStores),
            SizedBox(height: 24),
            _buildSectionTitle('Гипермаркеты'),
            _buildStoreList(hypermarkets),
            SizedBox(height: 24),
            _buildSectionTitle('Всегда рядом'),
            _buildStoreList(nearbyStores),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressSection() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ДОСТАВИТЬ В',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.orange),
                SizedBox(width: 8),
                Text(
                  'ул. Пушкина, 15, кв. 50',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    // Изменить адрес
                  },
                  child: Text('Изменить'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildStoreList(List<Map<String, dynamic>> stores) {
    return Column(
      children: stores.map((store) {
        return Card(
          margin: EdgeInsets.only(bottom: 12),
          child: ListTile(
            contentPadding: EdgeInsets.all(12),
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  store['name'].substring(0, 2),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            title: Text(
              store['name'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              store['deliveryTime'],
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Переход в магазин
            },
          ),
        );
      }).toList(),
    );
  }

  // Данные магазинов
  final List<Map<String, dynamic>> popularStores = [
    {'name': 'SPAR4', 'deliveryTime': '20-25 мин'},
    {'name': 'Биоерог', 'deliveryTime': '20-25 мин'},
    {'name': 'Пятерочка', 'deliveryTime': '13-25 мин'},
    {'name': 'Магнит', 'deliveryTime': '15-25 мин'},
    {'name': 'Перекрёсток', 'deliveryTime': '30-40 мин'},
  ];

  final List<Map<String, dynamic>> hypermarkets = [
    {'name': 'ЭЛЕНТА', 'deliveryTime': 'СЕТЬ ГИПЕРМАРКЕТОВ'},
    {'name': 'Гипер лента', 'deliveryTime': '60-90 мин'},
  ];

  final List<Map<String, dynamic>> nearbyStores = [
    {'name': 'Магнит семейный', 'deliveryTime': '40-50 мин'},
    {'name': 'FIXprice', 'deliveryTime': 'BKYCBMAA'},
  ];
}