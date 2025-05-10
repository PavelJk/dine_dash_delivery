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
    },
    {
      'title': 'Панкейки на кефире пышные',
      'time': '30 мин',
    },
    {
      'title': 'Фруктовый смузи в блендере на кефире',
      'time': '10 мин',
    },
    {
      'title': 'Блины из рисовой муки',
      'time': '30 мин',
    },
    {
      'title': 'Лаваш с колбасой и яйцом',
      'time': '10 мин',
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