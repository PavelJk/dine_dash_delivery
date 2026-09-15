# Dine Dash Delivery 🍔🛵

Приложение для доставки еды, разработанное на **Flutter**. Проект поддерживает все основные платформы: Android, iOS, Web, Windows, macOS и Linux.

## 📋 О проекте

**Dine Dash Delivery** — это кроссплатформенное мобильное и веб-приложение для заказа и доставки еды. Проект находится в активной разработке и включает в себя интеграцию с картами и геолокацией.

## ✨ Основные возможности

- 🔐 Аутентификация пользователей
- 🍽️ Просмотр меню и блюд
- 🛒 Корзина и оформление заказов
- 🗺️ Интеграция с Google Maps
- 📍 Определение местоположения (geolocator)
- 🚚 Отслеживание доставки
- 🎨 Кастомная иконка приложения и splash scre

## 🛠️ Технологии

- **Flutter** — основной фреймворк
- **Dart** — язык программирования
- **Google Maps** — карты и навигация
- **Geolocator** — геолокация
- **Flutter Native Splash** — настройка splash screen (`splash.yaml`)

## 📁 Структура проекта

dine_dash_delivery/
- android/ # Нативная конфигурация для Android
├── ios/ # Нативная конфигурация для iOS
├── linux/ # Конфигурация для Linux
├── macos/ # Конфигурация для macOS
├── web/ # Конфигурация для Web
├── windows/ # Конфигурация для Windows (интеграция Google Maps и geolocator)
├── assets/ # Ресурсы приложения
│ ├── icons/ # Иконки приложения и интерфейса
│ └── images/ # Изображения (фото блюд, логотипы ресторанов, баннеры)
├── lib/ # Исходный код на Dart
│ ├── main.dart # Точка входа в приложение
│ ├── models/ # Модели данных (Restaurant, Dish, Order, User)
│ ├── screens/ # Экраны приложения (Home, Cart, Map, Profile)
│ ├── services/ # Сервисы (API, геолокация, карты, авторизация)
│ └── widgets/ # Переиспользуемые виджеты
├── test/ # Тесты
├── splash.yaml # Конфигурация splash screen
├── pubspec.yaml # Зависимости проекта
└── README.md # Документация проекта


## 🚀 Начало работы

### Требования

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (версия 3.x или выше)
- [Dart SDK](https://dart.dev/get-dart)
- Android Studio / Xcode / VS Code с плагином Flutter

### Установка

1. Клонируйте репозиторий:
bash
git clone https://github.com/PavelJk/dine_dash_delivery.git
cd dine_dash_delivery
   
2. Установите зависимости
flutter pub get

3. Проверьте подключение устройств
flutter devices
