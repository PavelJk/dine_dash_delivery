import 'package:flutter/material.dart';

// Страница с бургерами
class MenuCategoryScreen extends StatelessWidget {
  final List<Map<String, String>> burgers = [
    {
      'name': 'Бургер "Бивстро"',
      'restaurant': 'Розовый Сад',
      'price': '340 р',
    },
    {
      'name': 'Бургер "Дымящий"',
      'restaurant': 'Ресторан Cafenio',
      'price': '300 р',
    },
    {
      'name': 'Бургер "Баффало"',
      'restaurant': 'Кухня Фирмы Koji',
      'price': '400 р',
    },
    {
      'name': 'Бургер "Яблочко"',
      'restaurant': 'Ресторан "Кебаб"',
      'price': '350 р',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Популярные Бургеры "gtrtr"',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: burgers.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              final burger = burgers[index];
              return ListTile(
                title: Text(
                  burger['name']!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(burger['restaurant']!),
                trailing: Text(
                  burger['price']!,
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Рестораны',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Смотреть все >'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Страница с овощами
class VegetablesPage extends StatelessWidget {
  final List<Map<String, String>> vegetables = [
    {'name': 'Огурцы гладкие', 'price': '115 ₽', 'weight': '500 ₽'},
    {'name': 'Огурец, 200г', 'price': '115 ₽', 'weight': '200 ₽'},
    {'name': 'Картофель вес', 'price': '115 ₽', 'weight': '2 кг'},
    {'name': 'Картофель красный вес', 'price': '135 ₽', 'weight': '3 кг'},
    {'name': 'Картофель криммаластеризованный', 'price': '100 ₽', 'weight': '500 ₽'},
    {'name': 'Картофель белорусский вес', 'price': '288 ₽', 'weight': '3 кг'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Овощи',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            children: vegetables.map((veg) {
              return Card(
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        veg['name']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        veg['price']!,
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      ),
                      SizedBox(height: 4),
                      Text(
                        veg['weight']!,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}