import 'package:flutter/material.dart';

class VideoRecipesScreen extends StatelessWidget {
  final List<String> categories = [
    'Завтраки',
    'Супы',
    'Вторые блюда',
    'Закуски'
  ];

  final List<Map<String, dynamic>> breakfastRecipes = [
    {
      'title': 'Сырники с малиновым вареньем',
      'time': '45 мин',
      'image': 'assets/cheesecakes.jpg'
    },
    {
      'title': 'Панкейки на кефире пышные',
      'time': '30 мин',
      'image': 'assets/pancakes.jpg'
    },
    {
      'title': 'Фруктовый смузи в блендере на кефире',
      'time': '10 мин',
      'image': 'assets/smoothie.jpg'
    },
    {
      'title': 'Блины из рисовой муки',
      'time': '30 мин',
      'image': 'assets/pancakes_rice.jpg'
    },
    {
      'title': 'Лаваш с колбасой и яйцом',
      'time': '10 мин',
      'image': 'assets/lavash.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Видео рецепты'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Категории
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Категории',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: FilterChip(
                      label: Text(categories[index]),
                      selected: index == 0,
                      onSelected: (selected) {},
                      selectedColor: Colors.orange[100],
                      checkmarkColor: Colors.orange,
                    ),
                  );
                },
              ),
            ),
            // Рецепты
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Завтраки',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 12),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: breakfastRecipes.length,
              itemBuilder: (context, index) {
                final recipe = breakfastRecipes[index];
                return _buildRecipeCard(recipe);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeCard(Map<String, dynamic> recipe) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Изображение с иконкой видео
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  recipe['image'],
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ],
          ),
          // Описание рецепта
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe['title'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.timer, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      recipe['time'],
                      style: TextStyle(color: Colors.grey),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.bookmark_border),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}