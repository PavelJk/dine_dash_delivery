import 'package:dine_dash_delivery/src/feature/home/model/info_restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Карточка ресторана отображает название, рейтинг и время доставки', (WidgetTester tester) async {
    final mockRestaurant = Restaurant(
      nameRestaurant: 'Бургер Кинг',
      menuRestaurant: 'а-п-р-о',
      ratingRestaurant: '4.7',
      deliveryRestaurant: 'бес',
      clockRestaurant: '20-30 мин',
      imageRestaurant: '',
    );
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RestaurantCard(restaurant: mockRestaurant),
        ),
      ),
    );
    expect(find.text('Burger King'), findsOneWidget);
    expect(find.text('4.7'), findsOneWidget);
    expect(find.text('20-30 мин'), findsOneWidget);
  });

  testWidgets('Кнопка "Добавить в корзину" увеличивает счетчик', (WidgetTester tester) async {
    int counter = 0;
    
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ElevatedButton(
            onPressed: () => counter++,
            child: const Text('Добавить в корзину'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Добавить в корзину'));
    await tester.pump();
    expect(counter, equals(1));
  });

  testWidgets('Пустая корзина показывает сообщение "Корзина пуста"', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CartScreen(items: []),
        ),
      ),
    );
    expect(find.text('Корзина пуста'), findsOneWidget);
    expect(find.byType(CartItemCard), findsNothing);
  });

  testWidgets('Корзина отображает список добавленных товаров', (WidgetTester tester) async {
    final mockItems = [
      CartItem(id: '1', name: 'Чизбургер', price: 199, quantity: 2),
      CartItem(id: '2', name: 'Кола', price: 99, quantity: 1),
    ];
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CartScreen(items: mockItems),
        ),
      ),
    );
    expect(find.text('Чизбургер'), findsOneWidget);
    expect(find.text('199 ₽ x 2'), findsOneWidget);
    expect(find.text('Кола'), findsOneWidget);
  });

  testWidgets('Форма заказа содержит поля: адрес, телефон, комментарий', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: OrderForm(),
        ),
      ),
    );

    expect(find.byKey(const Key('addressField')), findsOneWidget);
    expect(find.byKey(const Key('phoneField')), findsOneWidget);
    expect(find.byKey(const Key('commentField')), findsOneWidget);
  });

  testWidgets('При отправке заказа показывается CircularProgressIndicator', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: OrderScreen(isLoading: true),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Отправка заказа...'), findsOneWidget);
  });
}













OrderScreen({required bool isLoading}) {
}

Widget? OrderForm (){
  return null;
}
















CartItem({required String id, required String name, required int price, required int quantity}) {
}

















class CartItemCard {
}

CartScreen({required List items}) {
}






RestaurantCard({required Restaurant restaurant}) {
}

