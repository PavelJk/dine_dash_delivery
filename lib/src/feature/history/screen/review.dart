import 'package:flutter/material.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> with SingleTickerProviderStateMixin {
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
        title: const Text('Мои отзывы'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Ждут отзыва'),
            Tab(text: 'Мои отзывы'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildPendingReviews(),
          _buildMyReviews(),
        ],
      ),
    );
  }

  Widget _buildPendingReviews() {
    final items = [
      'Вегетарианский буррито',
      'Полоски бекона из индейки',
      'Суп "Борщ"',
      'Пицца "Буффало"',
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) => _buildReviewItem(items[index], true),
    );
  }

  Widget _buildMyReviews() {
    final items = [
      'Вегетарианский буррито',
      'Полоски бекона из индейки',
      'Суп "Борщ"',
      'Пицца "Буффало"',
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) => _buildReviewItem(items[index], false),
    );
  }

  Widget _buildReviewItem(String title, bool isPending) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            if (isPending)
              ElevatedButton(
                onPressed: () {
                  _showReviewDialog(context, title);
                },
                child: const Text('Оставить отзыв'),
              )
            else
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Icon(Icons.star_outline, color: Colors.amber, size: 16),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Хорошее качество, быстрая доставка. Буду заказывать еще!',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void _showReviewDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Оцените $title'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Ваша оценка:'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [1, 2, 3, 4, 5].map((star) => IconButton(
                icon: Icon(
                  star <= 3 ? Icons.star : Icons.star_outline,
                  color: Colors.amber,
                ),
                onPressed: () {
                },
              )).toList(),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Ваш отзыв (необязательно)',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Отправить'),
          ),
        ],
      ),
    );
  }
}