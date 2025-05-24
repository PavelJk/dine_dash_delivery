import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/home/data/data.dart';
import 'package:dine_dash_delivery/src/feature/home/model/info_restaurant.dart';
import 'package:dine_dash_delivery/src/feature/widgets/main_button.dart';
import 'package:dine_dash_delivery/src/feature/widgets/product_card.dart';
import 'package:dine_dash_delivery/src/feature/widgets/restaurant_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class FoodCategoryScreen extends StatefulWidget {
  final String hor;
  const FoodCategoryScreen({super.key, required this.hor});

  @override
  State<FoodCategoryScreen> createState() => _FoodCategoryScreenState();
}

class _FoodCategoryScreenState extends State<FoodCategoryScreen> {
    String? _selectedCategory;
  late final Future<List<Restaurant>> restaurantFuture;
  List<Restaurant> restaurants = [];
  final List<bool> _deliveryOptionsSelected = [true, false, false, true];
  final List<bool> _deliveryTimeSelected = [true, false, false];
  double _minPrice = 0;
  double _maxPrice = 999999;
  int _rating = 0;

  @override
  void initState() {
    super.initState();
    restaurantFuture = getRestaurant(context);
    if (_categories.contains(widget.hor)) {
      _selectedCategory = widget.hor;
    } else {
      _selectedCategory = _categories.first;
    }
  }

  final List<String> _categories = [
    'БУРГЕРЫ',
    'ПИЦЦА',
    'РЕСТОРАНЫ',
    'СУШИ',
    'ДЕСЕРТЫ',
    'САЛАТЫ'
  ];

  // Данные для разных категорий
  final Map<String, List<Map<String, String>>> _categoryItems = {
    'БУРГЕРЫ': [
      {
        'name': 'Воппер По-испански',
        'place': 'Бургер Кинг',
        'price': '349',
        'image': 'https://avatars.mds.yandex.net/i?id=5cd7767cd13d73d2ecaf804373ea992fdcffd804-12658900-images-thumbs&n=13',
      },
      {
        'name': 'Чикен Тар-Тар',
        'place': 'Бургер Кинг',
        'price': '229',
        'image': 'https://avatars.mds.yandex.net/i?id=e5df7be8eb79e6a90215dbea35c928b4e21a7070-12374505-images-thumbs&n=13',
      },
      {
        'name': 'Гранд Чиз',
        'place': 'Бургер Кинг',
        'price': '259',
        'image': 'https://avatars.mds.yandex.net/i?id=54d32bc6112f71dae8110a994f607fb48925b170-8220915-images-thumbs&n=13',
      },
      {
        'name': 'Цезарь Кинг',
        'place': 'Бургер Кинг',
        'price': '139',
        'image': 'https://avatars.mds.yandex.net/i?id=175092391a326d45505c54385bf91dfa7e6af092-5305527-images-thumbs&n=13',
      },
    ],
    'САЛАТЫ': [
      {
        'name': 'Греческий',
        'place': 'Ресторан Камелот',
        'price': '380',
        'image': 'https://avatars.mds.yandex.net/i?id=9b0ab17ecd729153a2a29718169114d833b7b193-4545247-images-thumbs&n=13',
      },
      {
        'name': 'Салат Пражский',
        'place': 'Ресторан Камелот',
        'price': '380',
        'image': 'https://avatars.mds.yandex.net/i?id=f7ed8a38684191362cce664e93050b136c1091f4-9107083-images-thumbs&n=13',
      },
    ],
    'ПИЦЦА': [
      {
        'name': 'Пицца "Микс"',
        'place': 'Автосуши',
        'price': '660',
        'image': 'https://avatars.mds.yandex.net/i?id=909efe3f0bfc6e5c8fbcbbce988c9b6fe0619846-5292008-images-thumbs&n=13',
      },
      {
        'name': 'Пицца с томатами и ветчиной',
        'place': 'Ресторан Камелот',
        'price': '500',
        'image': 'https://avatars.mds.yandex.net/i?id=8827a09d0e016286baa7de68f9cf42a286925d92-5886703-images-thumbs&n=13',
      },
      {
        'name': 'Пицца "Ямайка с креветками"',
        'place': 'Автосуши',
        'price': '415',
        'image': 'https://avatars.mds.yandex.net/i?id=3727e843a8163f70f249fbebe83873f6df1ecf70-5348428-images-thumbs&n=13'
      },
      {
        'name': 'Пицца "Пепперони"',
        'place': 'Автосуши',
        'price': '345',
        'image': 'https://avatars.mds.yandex.net/i?id=23dea17c9cee7d1d1ff9e3e30194452943d711af-5222634-images-thumbs&n=13',
      },
    ],
    'СУШИ': [
      {
        'name': 'Ролл "Флорида"',
        'place': 'Автосуши',
        'price': '365',
        'image': 'https://avatars.mds.yandex.net/i?id=cf71a829e0f4ae560f10d2d136528eed1bcacdd3-6637353-images-thumbs&n=13',
      },
      {
        'name': 'Ролл 4 сыра',
        'place': 'Автосуши',
        'price': '370',
        'image': 'https://avatars.mds.yandex.net/i?id=9eb40c26b72c30022307c9ce81953f9c8e2facef-12423753-images-thumbs&n=13',
      },
      {
        'name': 'Ролл "Джамп"',
        'place': 'Автосуши',
        'price': '290',
        'image': 'https://avatars.mds.yandex.net/i?id=bf9693dd7351924b9eae59abf7d4239a8fec67be-4525867-images-thumbs&n=13',
      },
      {
        'name': 'Ролл "Цезарь Темпура"',
        'place': 'Автосуши',
        'price': '310',
        'image': 'https://avatars.mds.yandex.net/i?id=b6667793c72d313bbd288802c758d5bdbe4007c5d907e9c8-6909092-images-thumbs&n=13',
      },
    ],
    'ДЕСЕРТЫ': [
      {
        'name': 'Тирамису',
        'place': 'Автосуши',
        'price': '235',
        'image': 'https://avatars.mds.yandex.net/i?id=80add6aa1500b4a296b1e1dc6dab3187c40d6aef-9229750-images-thumbs&n=13',
      },
      {
        'name': 'Шоколадный шейк',
        'place': 'Бургер Кинг',
        'price': '179',
        'image': 'https://orderapp-static.burgerkingrus.ru/x256/mobile_image/368255ba2850e49cbed6a2da4da4b430.webp',
      },
      {
        'name': 'Крепт Сюзетт',
        'place': 'Ресторан Камелот',
        'price': '330',
        'image': 'https://avatars.mds.yandex.net/i?id=77f0a9e192ef42be788982f7e6cd78caec664b0c-8182695-images-thumbs&n=13',
      },
      {
        'name': 'Ролл "Тропик"',
        'place': 'Автосуши',
        'price': '335',
        'image': 'https://avatars.mds.yandex.net/i?id=a7c9573fd92d2976d8bb7bd441f782889e2ee7fe-3691998-images-thumbs&n=13',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75,
        scrolledUnderElevation: 0,
        toolbarHeight: 75,
        actionsPadding: const EdgeInsets.only(right: 24),
        title: DropdownButtonFormField<String>(
          value: _selectedCategory,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 214, 217, 220)),
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 214, 217, 220)),
              borderRadius: BorderRadius.circular(20),
            ),
            filled: true,
            fillColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
          ),
          icon: Padding(
            padding: const EdgeInsets.only(right: 3),
            child: Icon(Icons.arrow_drop_down),
          ),
          elevation: 2,
          style: TextStyle(
            fontSize: 13,
            color: Color(0xff181C2E),
            fontWeight: FontWeight.bold
          ),
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                _selectedCategory = newValue;
              });
            }
          },
          items: _categories.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(value),
              ),
            );
          }).toList(),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: GestureDetector(
            onTap: () => context.pop(),
            child: CircleAvatar(
              backgroundColor: Colors.black.withAlpha(25),
              child: Padding(
                padding: const EdgeInsets.only(right: 1),
                child: SvgPicture.asset(
                  PathImages.back,
                  width: 8,
                  colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => context.goNamed(AppRoute.search.name),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: SvgPicture.asset(
                PathImages.search,
                width: 19,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () => _showFilterDialog(context),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.black.withAlpha(25),
              child: SvgPicture.asset(
                PathImages.fillter,
                width: 24,
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Restaurant>>(
        future: restaurantFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            restaurants = snapshot.data!;
            return _buildContentForCategory();
          } else {
            return const Center(child: Text('Нет данных о ресторанах'));
          }
        },
      ),
    );
  }

  Widget _buildContentForCategory() {
    switch (_selectedCategory) {
      case 'РЕСТОРАНЫ':
        return _buildRestaurantsList();
      default:
        return _buildCategoryItemsList();
    }
  }

  Widget _buildCategoryItemsList() {
    final items = _categoryItems[_selectedCategory] ?? [];
    _selectedCategory?.toLowerCase();

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(right: 24, left: 24, top: 15, bottom: 8),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Text(
                'Популярные ${_selectedCategory?.toLowerCase()}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ]),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildProductItem(items[index]),
              childCount: items.length,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Рестораны",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _selectedCategory = 'РЕСТОРАНЫ';
                      });
                    },
                    label: Text(
                      'Смотреть все',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    icon: SvgPicture.asset(PathImages.forward),
                    iconAlignment: IconAlignment.end,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      splashFactory: NoSplash.splashFactory,
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
        _buildRestaurantsPreview(),
      ],
    );
  }

  Widget _buildRestaurantsPreview() {
    return SliverList.builder(
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        final restaurant = restaurants[index];
        
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 21, vertical: 10),
          child: MyRestaurantCard(
            nameRestaurant: restaurant.nameRestaurant,
            menuRestaurant: restaurant.menuRestaurant,
            ratingRestaurant: restaurant.ratingRestaurant,
            deliveryRestaurant: restaurant.deliveryRestaurant,
            clockRestaurant: restaurant.clockRestaurant,
            imageRestaurant: restaurant.imageRestaurant,
          ),
        );
      },
    );
  }

  Widget _buildRestaurantsList() {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(right: 24, left: 24, top: 12),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const Text(
                'Все рестораны',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ]),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 15),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final restaurant = restaurants[index];
                return MyRestaurantCard(
                  nameRestaurant: restaurant.nameRestaurant,
                  menuRestaurant: restaurant.menuRestaurant,
                  ratingRestaurant: restaurant.ratingRestaurant,
                  deliveryRestaurant: restaurant.deliveryRestaurant,
                  clockRestaurant: restaurant.clockRestaurant,
                  imageRestaurant: restaurant.imageRestaurant,
                );
              },
              childCount: restaurants.length,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductItem(Map<String, String> item) {
    return MyCustonCardProduct(
      name: item['name']!,
      place: item['place']!, 
      price: item['price']!, 
      image: item['image']!
    );
  }

void _showFilterDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.82,
        child: StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 21),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context),
                    const SizedBox(height: 10),
                    _buildDeliveryOptions(context, setModalState),
                    const SizedBox(height: 20),
                    _buildDeliveryTimeOptions(context, setModalState),
                    const SizedBox(height: 20),
                    _buildPriceFilter(setModalState),
                    const SizedBox(height: 20),
                    _buildRatingFilter(setModalState),
                    const SizedBox(height: 20),
                    MyCustomMainButton(
                      onPressed: () {},
                      text: 'ПРИМЕНИТЬ',
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ),
  );
}

Widget _buildHeader(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Фильтр',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      ),
      GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const CircleAvatar(
          backgroundColor: Color(0xffECF0F4),
          radius: 21,
          child: Icon(Icons.close),
        ),
      ),
    ],
  );
}

Widget _buildDeliveryOptions(BuildContext context, StateSetter setModalState) {
  final List<String> deliveryLabels = ['Доставка', 'Самовывоз', 'Акции', 'Онлайн-оплата'];
  final List<double> deliveryWidths = [101, 110, 78, 148];
  
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'ВЫБРАТЬ',
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
      ),
      const SizedBox(height: 10),
      Wrap(
        spacing: 10,
        runSpacing: 10,
        children: List.generate(deliveryLabels.length, (index) {
          return GestureDetector(
            onTap: () {
              setModalState(() {
                _deliveryOptionsSelected[index] = !_deliveryOptionsSelected[index];
              });
            },
            child: _buildFilterChip(
              context: context,
              label: deliveryLabels[index],
              width: deliveryWidths[index],
              isSelected: _deliveryOptionsSelected[index],
            ),
          );
        }),
      ),
    ],
  );
}

Widget _buildDeliveryTimeOptions(BuildContext context, StateSetter setModalState) {
  final List<String> timeLabels = ['10-15 мин', '20 мин', '30 мин'];
  
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'ВРЕМЯ ДОСТАВКИ',
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
      ),
      const SizedBox(height: 10),
      Wrap(
        spacing: 10,
        runSpacing: 10,
        children: List.generate(timeLabels.length, (index) {
          return GestureDetector(
            onTap: () {
              setModalState(() {
                // Сделать выбор только одного варианта времени
                for (int i = 0; i < _deliveryTimeSelected.length; i++) {
                  _deliveryTimeSelected[i] = (i == index);
                }
              });
            },
            child: _buildFilterChip(
              context: context,
              label: timeLabels[index],
              width: 97,
              isSelected: _deliveryTimeSelected[index],
            ),
          );
        }),
      ),
    ],
  );
}

Widget _buildPriceFilter(StateSetter setModalState) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'ЦЕНА',
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
      ),
      const SizedBox(height: 10),
      Row(
        children: [
          const Text('ОТ', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '0',
                hintStyle: TextStyle(color: Color.fromARGB(244, 146, 146, 149)),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) => setModalState(() {
                _minPrice = double.tryParse(value) ?? 0;
              }),
            ),
          ),
          const SizedBox(width: 10),
          const Text('ДО', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: "9999999",
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                hintStyle: TextStyle(color: Color.fromARGB(244, 146, 146, 149)),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) => setModalState(() {
                _maxPrice = double.tryParse(value) ?? 999999;
              }),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildRatingFilter(StateSetter setModalState) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'РЕЙТИНГ',
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(5, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () => setModalState(() => _rating = index + 1),
              child: CircleAvatar(
                radius: 22,
                backgroundColor: const Color(0xff292925),
                child: Icon(
                  Icons.star,
                  color: index < _rating 
                    ? Theme.of(context).colorScheme.tertiary 
                    : const Color(0xffDCDCDC),
                  size: 17,
                ),
              ),
            ),
          );
        }),
      ),
    ],
  );
}

Widget _buildFilterChip({
  required BuildContext context,
  required String label,
  required double width,
  required bool isSelected,
}) {
  return Container(
    width: width,
    height: 46,
    decoration: BoxDecoration(
      color: isSelected 
        ? Theme.of(context).colorScheme.tertiary 
        : Colors.transparent,
      border: Border.all(
        color: isSelected 
          ? Theme.of(context).colorScheme.tertiary 
          : const Color(0xffEDEDED)),
      borderRadius: BorderRadius.circular(33),
    ),
    child: Center(
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          fontSize: 15,
          color: isSelected ? Colors.black : Colors.black,
        )
      ),
    ),
  );
}
}