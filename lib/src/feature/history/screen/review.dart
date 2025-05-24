import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/history/widgets/history_appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      appBar: HistoryAppBar(
        title: 'Мои отзывы', 
        textTabBarOne: 'Ждут отзыва', 
        textTabBarTwo: 'Мои отзывы',
        controller: _tabController,
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
      'Бургер Кинг',
    ];
    final items2 = [
      'https://avatars.mds.yandex.net/i?id=fa41e27c5f7ac00bdf09fbc23aaf2b9643684aa5-12625178-images-thumbs&n=13',
      
    ];
    return ListView.builder(
      padding: const EdgeInsets.all(22),
      itemCount: items.length,
      itemBuilder: (context, index) => _buildReviewItem(items[index], items2[index], null, null, null, null, true),
    );
  }

  Widget _buildMyReviews() {
    final items = [
      'Вкусно-И Точка',
      'Пиццерия Милано',
    ];
    final items2 = [
      'https://avatars.mds.yandex.net/i?id=9d409d39e7998ae6482cbd4a0ea45a9fe49d78ac-6221753-images-thumbs&n=13',
      'https://avatars.mds.yandex.net/i?id=1cd619b20cfedad63c2c431bf8d2dcaa967b3e9c-10636727-images-thumbs&n=13',
    ];
    final items3 = [
      '25.01.25',
      '12.04.25',
    ];
    final items4 = [
      'Здорово и вкусно',
      'Отличная еда и обслуживание',
    ];
    final items5 = [
      'Не могу сказать, что остался в восторге. Заказывал салаты и десерт, но один из салатов пришел не тем, что я заказывал. Однако служба поддержки быстро всё исправила и предложила скидку на следующий заказ.',
      'Заказал пиццу и суши через доставку, и остался очень доволен! Пицца была горячей и вкусной, а суши свежими. Доставили быстро, всего за 25 минут. Обязательно закажу еще!',
    ];
    final items6 = [4,5];
    return ListView.builder(
      padding: const EdgeInsets.all(22),
      itemCount: items.length,
      itemBuilder: (context, index) => _buildReviewItem(items[index], items2[index], items3[index], items4[index], items5[index], items6[index], false),
    );
  }

  Widget _buildReviewItem(String title, String image, String? data, String? header, String? body, int? rating, bool isPending) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: isPending ? GestureDetector(
        onTap: () {
          context.goNamed(
            AppRoute.addReviewScreen.name,
            pathParameters:{
              "productName" : title,
              "productImage" : image,
            },
          );
        },
        child: Card(
          color: Color(0xffF6F6F6),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          image,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(5, (index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 1), 
                                child: Icon(
                                  Icons.star,
                                  color: Color(0xffC7C7C7),
                                  size: 31,
                                ),
                              );
                            }),
                          ),
                        ],
                      )
                    ],
                  )
                  ], 
                  )))):
                  Card(
                    color: Color(0xffF6F6F6),
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data!,
                            style: TextStyle(fontSize: 12, color: Color(0xff9C9BA6), fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 15),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            height: 55,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Color(0xff9C9BA6))
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    image,
                                    width: 42,
                                    height: 42,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  title,
                                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            header!,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          SizedBox(height: 7),
                          Row(
                            children: [
                              for (int i = 0; i < rating!; i++)
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              for (int i = 0; i < 5-rating; i++)
                              Icon(Icons.star_outline, color: Colors.amber, size: 16),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            body!,
                            style: TextStyle(fontSize: 12, color: Color(0xff747783), fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
            );
  }
}