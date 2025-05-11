import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteItems = [
    {
      'title': 'Пицца По-Европейски',
      'restaurant': 'Пиццерия Милано',
      'price': 820,
      'image': 'assets/pizza_european.jpg',
    },
    {
      'title': 'Суп Борщ',
      'restaurant': 'White Rabbit',
      'price': 600,
      'image': 'assets/borscht.jpg',
    },
    {
      'title': 'Грибной Суп',
      'restaurant': 'White Rabbit',
      'price': 700,
      'image': 'assets/mushroom_soup.jpg',
    },
    {
      'title': 'Бургер Бивстро',
      'restaurant': 'Розовый Сад',
      'price': 340,
      'image': 'assets/burger.jpg',
    },
    {
      'title': 'Пицца Милано',
      'restaurant': 'Пиццерия Милано',
      'price': 580,
      'image': 'assets/pizza_milano.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Избранное'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: favoriteItems.length,
        separatorBuilder: (context, index) => Divider(height: 24),
        itemBuilder: (context, index) {
          final item = favoriteItems[index];
          return _buildFavoriteItem(item);
        },
      ),
    );
  }

  Widget _buildFavoriteItem(Map<String, dynamic> item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            item['image'],
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),*/
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['title'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              Text(
                item['restaurant'],
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 8),
              Text(
                '${item['price']} ₽',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800],
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.favorite, color: Colors.red),
          onPressed: () {},
        ),
      ],
    );
  }
}