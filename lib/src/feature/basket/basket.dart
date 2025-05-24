import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  bool isEditMode = false;
  List<CartItem> cartItems = [
    CartItem(
      name: 'Пицца "Пепперони"', 
      price: 345, 
      size: '14 см',
      quantity: 2,
      image: 'https://avatars.mds.yandex.net/i?id=23dea17c9cee7d1d1ff9e3e30194452943d711af-5222634-images-thumbs&n=13',
    ),
    CartItem(
      name: 'Пицца "Микс"', 
      price: 660, 
      size: '13 см',
      quantity: 1,
      image: 'https://avatars.mds.yandex.net/i?id=909efe3f0bfc6e5c8fbcbbce988c9b6fe0619846-5292008-images-thumbs&n=13',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    int totalPrice = cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              Color(0xFFFFEA9F),
              Color.fromARGB(187, 232, 124, 0),
            ],
            stops: [0.0, 1.0],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leadingWidth: 70,
            scrolledUnderElevation: 0,
            toolbarHeight: 75,
            actionsPadding: const EdgeInsets.only(right: 24),
            title: Text(
              'Корзина',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: GestureDetector(
                onTap: () {
                  context.pop('value');
                },
                child: CircleAvatar(
                  backgroundColor: Colors.black.withAlpha(25),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 1),
                    child: SvgPicture.asset(
                      PathImages.back,
                      width: 8,
                      colorFilter:
                          const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    isEditMode = !isEditMode;
                  });
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  splashFactory: NoSplash.splashFactory,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    isEditMode ? 'ЗАВЕРШИТЬ' : 'РЕДАКТИРОВАТЬ',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffC24400),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              // Cart items list with flexible space
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _buildCartItem(item, isEditMode),
                      );
                    },
                  ),
                ),
              ),
              
              // Bottom section with address and total
              Container(
                height: 310,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'АДРЕС ДОСТАВКИ',
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  fontSize: 14, 
                                  color: const Color(0xffA0A5BA)),
                          ),
                          TextButton(
                            onPressed: () {
                              context.goNamed(AppRoute.map.name);
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              splashFactory: NoSplash.splashFactory,
                            ),
                            child: const Text(
                              'ИЗМЕНИТЬ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffC24400),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 62,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xffF0F5FA),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'c. Семеновка, пер. Советский, д. 2Б, домофон синий забор позвонить',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  fontSize: 15, 
                                  color: const Color.fromARGB(255, 118, 123, 147)),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'ОБЩАЯ ЦЕНА:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffA0A5BA),
                            ),
                          ),
                          Text(
                            '$totalPrice р.',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(fontSize: 30),
                          ),
                        ],
                      ),
                      const Spacer(),
                      
                      MyCustomMainButton(
                        onPressed: () {
                          context.goNamed(
                            AppRoute.paymentMethodScreen.name,
                            pathParameters:{
                              "totalAmount" : '$totalPrice',
                              "isCard" : 'false',
                              "cardNumber" : 'tet',
                            },
                          );
                        },
                        text: 'ПРОДОЛЖИТЬ',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartItem(CartItem item, bool showEditButtons) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              item.image,
              width: 130,
              height: 130,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 110,
                              child: Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            if (isEditMode)
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    cartItems.remove(item);
                                  });
                                },
                                child: const CircleAvatar(
                                  radius: 13.5,
                                  backgroundColor: Color.fromARGB(57, 35, 35, 35),
                                  child: Icon(
                                    Icons.close_outlined,
                                    size: 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${item.price * item.quantity} руб.',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 13),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.size,
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                fontSize: 16,
                                color: const Color.fromARGB(106, 35, 35, 35)),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 82,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (item.quantity > 1) {
                                      item.quantity--;
                                    }
                                  });
                                },
                                child: const CircleAvatar(
                                  radius: 11,
                                  backgroundColor: Color.fromARGB(57, 35, 35, 35),
                                  child: Icon(
                                    Icons.remove,
                                    size: 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Text(
                                item.quantity.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    item.quantity++;
                                  });
                                },
                                child: const CircleAvatar(
                                  radius: 11,
                                  backgroundColor: Color.fromARGB(57, 35, 35, 35),
                                  child: Icon(
                                    Icons.add,
                                    size: 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final String name;
  final int price;
  final String size;
  int quantity;
  final String image;

  CartItem({
    required this.name,
    required this.price,
    required this.size,
    required this.quantity,
    required this.image,
  });
}