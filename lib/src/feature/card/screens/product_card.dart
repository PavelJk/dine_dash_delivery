import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final bool isPizza; // Флаг для определения типа продукта
  final Map<String, dynamic> productData;

  const ProductDetailScreen({
    Key? key,
    required this.isPizza,
    required this.productData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                productData['imageUrl'],
                fit: BoxFit.cover,
              ),
            ),
            pinned: true,
            actions: [
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productData['title'],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (isPizza) ...[
                    SizedBox(height: 8),
                    Text(
                      productData['restaurant'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                  SizedBox(height: 16),
                  _buildRatingAndDelivery(isPizza),
                  if (isPizza) ...[
                    SizedBox(height: 16),
                    Text(
                      'Состав: ${productData['composition']}',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                  if (!isPizza) ...[
                    SizedBox(height: 8),
                    Text(
                      productData['weight'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                  SizedBox(height: 24),
                  if (!isPizza) _buildNutritionInfo(),
                  if (isPizza) _buildSizeSelector(),
                  SizedBox(height: 24),
                  Divider(),
                  if (!isPizza) _buildMoreInfoButton(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildRatingAndDelivery(bool isPizza) {
    return Row(
      children: [
        if (isPizza) ...[
          Icon(Icons.star, color: Colors.amber, size: 20),
          SizedBox(width: 4),
          Text(
            '${productData['rating']}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 8),
          Text(
            productData['deliveryPrice'],
            style: TextStyle(color: Colors.green),
          ),
        ],
        Spacer(),
        if (isPizza)
          Text(
            productData['deliveryTime'],
            style: TextStyle(color: Colors.grey),
          ),
      ],
    );
  }

  Widget _buildNutritionInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'На 100 граммов',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNutritionItem('1.1 г', 'белки'),
            _buildNutritionItem('0.3 г', 'жиры'),
            _buildNutritionItem('9 г', 'углеводы'),
            _buildNutritionItem('29', 'ккал'),
          ],
        ),
      ],
    );
  }

  Widget _buildNutritionItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildSizeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'РАЗМЕР:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: ['10', '14', '16'].map((size) {
            return Padding(
              padding: EdgeInsets.only(right: 16),
              child: ChoiceChip(
                label: Text(size),
                selected: size == '14',
                onSelected: (_) {},
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildMoreInfoButton() {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Подробнее о товаре',
        style: TextStyle(color: Colors.orange),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${productData['price']} руб.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (productData.containsKey('quantity'))
                Text(
                  '${productData['quantity']}',
                  style: TextStyle(color: Colors.grey),
                ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            onPressed: () {},
            child: Text(
              'В КОРЗИНУ',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}