import 'package:flutter/material.dart';

class CategoriesScrern extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Блюда'),
          _buildCategoryGrid([
            'Хот-Дог', 'Бургер', 'Суши', 'Шаурма', 'Десерты', 'Паста', 'Пицца', 'Шашлык', 'ЗОЖ', 'Фастфуд',
          ]),
          SizedBox(height: 20),
          _buildSectionTitle('Кухни'),
          // Здесь можно добавить список кухонь, если он есть
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCategoryGrid(List<String> categories) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: categories.map((category) {
        return Card(
          child: Center(
            child: Text(category),
          ),
        );
      }).toList(),
    );
  }
}

class CategoriesPageV2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Для вас'),
          _buildPromoCard('Скидки и акции', '%'),
          SizedBox(height: 20),
          _buildSectionTitle('Фруктовый прилавок'),
          _buildCategoryRow(['Фрукты и ягоды', 'Овощи и зелень']),
          SizedBox(height: 20),
          _buildSectionTitle('Вода и напитки'),
          _buildCategoryRow(['Вода', 'Газировка', 'Соки и морсы', 'Энергетики', 'Холодный чай']),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildPromoCard(String title, String discount) {
    return Card(
      color: Colors.amber[100],
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(discount, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryRow(List<String> categories) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: categories.map((category) {
        return Chip(
          label: Text(category),
          backgroundColor: Colors.grey[200],
        );
      }).toList(),
    );
  }
}