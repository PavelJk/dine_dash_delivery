import 'package:dine_dash_delivery/src/feature/auth/validators/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('Расчет итоговой суммы: 2 товара (300₽ и 500₽) + доставка 100₽ со скидкой 20%', () {
    final cartService = CartService();
    cartService.addItem(MenuItem(id: '1', name: 'Пицца', price: 300));
    cartService.addItem(MenuItem(id: '2', name: 'Суши', price: 500));
    
    expect(
      cartService.calculateTotal(deliveryFee: 100, discount: 0.2),
      equals((300 + 500 + 100) * 0.8), // 720₽
    );
  });

  test('Валидация номера телефона: корректный российский номер', () {
    expect(Validator.phoneNumber('+79123456789'), isTrue);
  });

  test('Валидация номера телефона: некорректный номер (менее 11 цифр)', () {
    expect(Validator.phoneNumber('+79123'), isFalse);
  });

  test('Применение промокода "HUNGRY20" дает 20% скидку', () {
    final promoService = PromoService();
    promoService.addPromo('HUNGRY20');
    
    expect(
      promoService.getDiscount(), 
      equals(0.2),
    );
  });

  test('Несуществующий промокод не дает скидки', () {
    final promoService = PromoService();
    promoService.addPromo('INVALID_CODE');
    
    expect(
      promoService.getDiscount(),
      equals(0.0),
    );
  });

  test('Добавление 1 товара в корзину увеличивает ее размер', () {
    final cartService = CartService();
    cartService.addItem(MenuItem(id: '1', name: 'Бургер', price: 250));
    
    expect(cartService.items.length, equals(1));
    expect(cartService.items[0].name, equals('Бургер'));
  });

  test('Проверка, что адрес в пределах зоны доставки (5 км от ресторана)', () {
    final restaurantLocation = Location(lat: 55.751244, lng: 37.618423); // Москва
    final userLocation = Location(lat: 55.753544, lng: 37.621423); // 300 м от ресторана
    
    expect(
      DeliveryService.isInDeliveryZone(
        userLocation: userLocation,
        restaurantLocation: restaurantLocation,
        maxDistanceKm: 5,
      ),
      isTrue,
    );
  });
}











class DeliveryService {
  static isInDeliveryZone({required userLocation, required restaurantLocation, required int maxDistanceKm}) {}
}








Location({required double lat, required double lng}) {
}
class PromoService {
  void addPromo(String s) {}
  
  getDiscount() {}
}
extension on CartService {
  void addItem(menuItem) {}
}
MenuItem({required String id, required String name, required int price}) {
}
class CartService {
  get items => null;

  calculateTotal({required int deliveryFee, required double discount}) {}
}
