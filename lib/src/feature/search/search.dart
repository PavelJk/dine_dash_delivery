import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchQuery = '';
  int _selectedFilter = 0; // 0-Все, 1-Рестораны, 2-Магазины

  final List<Map<String, dynamic>> searchResults = [
    {
      'type': 'restaurant',
      'name': 'Пиццерия Милано',
      'rating': 4.6,
      'deliveryTime': '20 мин',
      'items': [
        {
          'name': 'Пицца По-Европейски',
          'price': 820,
        },
        {
          'name': 'Пицца По-Гавайски',
          'price': 580,
        },
      ],
    },
    {
      'type': 'store',
      'name': 'Магнит',
      'deliveryTime': '20-25 мин',
      'items': [
        {
          'name': 'Пицца Сибирская Коллекция 4 Сыра',
          'price': 430,
        },
        {
          'name': 'Пицца Цезарь с ветчиной и грибами',
          'price': 300,
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Поиск',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey),
          ),
          style: TextStyle(fontSize: 20),
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFilterButton('Все', 0),
                _buildFilterButton('Рестораны', 1),
                _buildFilterButton('Магазины', 2),
              ],
            ),
          ),
          Divider(height: 1),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                Text(
                  'Найдено ${searchResults.length} результатов',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 16),
                ..._buildSearchResults(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String text, int index) {
    return TextButton(
      onPressed: () {
        setState(() {
          _selectedFilter = index;
        });
      },
      child: Text(text),
    );
  }

  List<Widget> _buildSearchResults() {
    List<Widget> widgets = [];
    
    for (var result in searchResults) {
      // Пропускаем если не соответствует фильтру
      if (_selectedFilter == 1 && result['type'] != 'restaurant') continue;
      if (_selectedFilter == 2 && result['type'] != 'store') continue;

      // Добавляем заголовок места
      widgets.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  result['name'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (result.containsKey('rating')) ...[
                  SizedBox(width: 8),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Text(
                    result['rating'].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
                Spacer(),
                Text(
                  result['deliveryTime'],
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 12),
          ],
        ),
      );

      // Добавляем товары
      for (var item in result['items']) {
        widgets.add(
          Card(
            margin: EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          result['name'],
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${item['price']} ₽',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      IconButton(
                        icon: Icon(Icons.add),
                        color: Colors.orange,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }

      widgets.add(SizedBox(height: 16));
    }

    return widgets;
  }
}