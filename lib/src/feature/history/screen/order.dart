import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/history/widgets/history_appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var MONTHS = ["янв", "фев", "мар", "апр", "май", "июн", "июл", "авг", "сен", "окт", "ноя", "дек"];

  String formattedDateTime() {
      DateTime now = DateTime.now();
      return "${now.day} ${MONTHS[now.month-1]}., ${now.hour}:${now.minute}";
  }
  List<_OrderItem> orders1 = [
      _OrderItem(
        id: '#240112',
        title: 'Кофе Вилль',
        image: 'https://avatars.mds.yandex.net/i?id=a473c0ccfdf43ebf31334b39d4bde8ffa1daac47-5314093-images-thumbs&n=13',
        price: '200 руб.',
        status: null,
        date: null,
      ),
    ];
    List<_OrderItem> orders2 = [
      _OrderItem(
        id: '#162432',
        title: 'Пиццерия Милано',
        image: 'https://avatars.mds.yandex.net/i?id=1cd619b20cfedad63c2c431bf8d2dcaa967b3e9c-10636727-images-thumbs&n=13',
        price: '2220 руб.',
        status: 'Завершен',
        date: '29 янв., 12:30',
      ),
      _OrderItem(
        id: '#242432',
        title: 'Вкусно-И Точка',
        image: 'https://avatars.mds.yandex.net/i?id=9d409d39e7998ae6482cbd4a0ea45a9fe49d78ac-6221753-images-thumbs&n=13',
        price: '1130 руб.',
        status: 'Завершен',
        date: '30 янв., 12:30',
      ),
    ];

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
        title: 'Мои заказы', 
        textTabBarOne: 'Текущие', 
        textTabBarTwo: 'История',
        controller: _tabController,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildActiveOrders(),
          _buildOrderHistory(),
        ],
      ),
    );
  }

  Widget _buildActiveOrders() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders1.length,
      itemBuilder: (context, index) => _buildOrderCard(orders1[index]),
    );
  }

  Widget _buildOrderHistory() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders2.length,
      itemBuilder: (context, index) => _buildOrderCard(orders2[index]),
    );
  }

  Widget _buildOrderCard(_OrderItem order) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Заказ № ${order.id}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(width: 30,),
              if (order.status != null)
                Text(
                  order.status!,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: order.status == 'Отменен' ? Colors.red : Colors.green,
                  ), 
                ),
            ],
          ),
          SizedBox(height: 5,),
          Divider(
            color: Color(0xffEEF2F6),
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  order.image,
                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(width: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.title,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(height: 7),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Text(
                          order.price,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        if (order.date != null) ...[
                          VerticalDivider(
                          color: Color(0xffCACCDA),
                        ),
                          Text(
                            order.date!,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 12,
                              color: Color(0xff6B6E82)
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    order.status == null ? print('нажал') : context.goNamed(AppRoute.review.name);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 38,
                    decoration: BoxDecoration(
                      color: order.status == null ? Theme.of(context).colorScheme.tertiary : Color(0xffE4E4E4),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: order.status == null ? Theme.of(context).colorScheme.tertiary : Color(0xffB4B4B4))
                    ),
                    child: Center(
                      child: Text(
                        order.status == null ? 'Отследить' : 'Оценить',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontSize: 12,
                      ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 40,),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if(order.status == null){
                      _deleteOrder(order);
                    }else{
                      print('нажал');
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 38,
                    decoration: BoxDecoration(
                      color: order.status == null ? Colors.transparent : Theme.of(context).colorScheme.tertiary,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: order.status == null ? Color(0xffFF3326) : Theme.of(context).colorScheme.tertiary)
                    ),
                    child: Center(
                      child: Text(
                        order.status == null ? 'Отменить' : 'Повторить',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: order.status == null ? Color(0xffFF3326) : null,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ]
          ),
        ],
      ),
    );
  }

  void _deleteOrder(_OrderItem orderr) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Отмена заказа'),
        content: Text('Вы уверены, что хотите отменить заказ "${orderr.id}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('выйти'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                orders1.remove(orderr);
                /*final da = DateTime.now();
                String format = DateFormat.MMMd().add_Hm().format(da);*/
                orderr.date = formattedDateTime();
                orderr.status = 'Отменен';
                orders2.add(orderr);
              });
              Navigator.pop(context);
            },
            child: const Text(
              'Отменить',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}



class _OrderItem {
  final String id;
  final String title;
  final String price;
  final String image;
  String? status;
  String? date;

  _OrderItem({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    this.status,
    this.date,
  });
}