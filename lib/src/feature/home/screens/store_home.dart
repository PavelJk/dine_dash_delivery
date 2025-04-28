import 'package:flutter/material.dart';

class StoreHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.red, // Цвет как в логотипе Магнит
                child: Center(
                  child: Text(
                    'МАГНИТ',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader('Категории', 'Смотреть все >'),
                  SizedBox(height: 12),
                  _buildCategoryChips(),
                  SizedBox(height: 24),
                  _buildSectionHeader('Скидки и акции', 'Смотреть все >'),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildProductItem(discountedProducts[index]),
              childCount: discountedProducts.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: _buildSectionHeader('Фрукты и ягоды', 'Смотреть все >'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String actionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(actionText),
        ),
      ],
    );
  }

  Widget _buildCategoryChips() {
    final categories = ['Все', 'Скидки и акции', 'Фрукты и ягоды'];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: categories.map((category) {
        return FilterChip(
          label: Text(category),
          selected: category == 'Все',
          onSelected: (selected) {},
          selectedColor: Colors.red[100],
          checkmarkColor: Colors.red,
        );
      }).toList(),
    );
  }

  Widget _buildProductItem(Map<String, dynamic> product) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Icon(Icons.shopping_basket, color: Colors.grey),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  if (product.containsKey('volume'))
                    Text(
                      product['volume'],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (product.containsKey('oldPrice'))
                  Text(
                    '${product['oldPrice']} ₽',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                Text(
                  '${product['price']} ₽',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 8),
                IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  color: Colors.red,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Пример данных товаров
  final List<Map<String, dynamic>> discountedProducts = [
    {
      'name': 'Напиток газированный Evervess Colo. 1 л.',
      'price': 90,
      'oldPrice': 104,
      'volume': '1 л',
    },
    {
      'name': 'Палочки кукурузные Кузя Лакомкин',
      'price': 60,
      'oldPrice': 100,
      'volume': '140 г',
    },
    {
      'name': 'Кофе Mon Original Натуральный',
      'price': 390,
      'oldPrice': 495,
    },
  ];
}