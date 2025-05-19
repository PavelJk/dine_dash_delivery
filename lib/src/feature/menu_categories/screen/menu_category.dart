import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/home/data/data.dart';
import 'package:dine_dash_delivery/src/feature/home/model/info_restaurant.dart';
import 'package:dine_dash_delivery/src/feature/widgets/main_button.dart';
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
  ];

  // Данные для разных категорий
  final Map<String, List<Map<String, String>>> _categoryItems = {
    'БУРГЕРЫ': [
      {
        'name': 'Воппер По-испански',
        'place': 'Бургер Кинг',
        'price': '349 р',
        'image': 'https://avatars.mds.yandex.net/i?id=5cd7767cd13d73d2ecaf804373ea992fdcffd804-12658900-images-thumbs&n=13',
      },
      {
        'name': 'Чикен Тар-Тар',
        'place': 'Бургер Кинг',
        'price': '229 р',
        'image': 'https://avatars.mds.yandex.net/i?id=e5df7be8eb79e6a90215dbea35c928b4e21a7070-12374505-images-thumbs&n=13',
      },
      {
        'name': 'Гранд Чиз',
        'place': 'Бургер Кинг',
        'price': '259 р',
        'image': 'https://avatars.mds.yandex.net/i?id=54d32bc6112f71dae8110a994f607fb48925b170-8220915-images-thumbs&n=13',
      },
      {
        'name': 'Биг Спешиал',
        'place': 'Вкусно — и точка',
        'price': '299 р',
        'image': 'https://avatars.mds.yandex.net/i?id=0c58eca209506cf55b9dead1ea3d94616756b2aa-9181886-images-thumbs&n=13',
      },
    ],
    'ПИЦЦА': [
      {
        'name': 'Пицца "Микс"',
        'place': 'Автопицца',
        'price': '660 р',
        'image': 'https://avatars.mds.yandex.net/i?id=909efe3f0bfc6e5c8fbcbbce988c9b6fe0619846-5292008-images-thumbs&n=13',
      },
      {
        'name': 'Пицца "Милано"',
        'place': 'Милано',
        'price': '360 р',
        'image': 'https://cdn.arora.pro/l/upload/64d836cd-bd93-4a0a-bf1f-f651d3c302b2/size-2/032be522-d3c2-4ec3-be77-b251005496f7.jpg?webp&scale=2&width=374&height=21',
      },
      {
        'name': 'Пицца "Сырная"',
        'place': 'Додо Пицца',
        'price': '359 р',
        'image': 'https://avatars.mds.yandex.net/i?id=bd617427c7dc5e69db2cf2e4c26e5bb00b58c0c3-6234058-images-thumbs&n=13'
      },
      {
        'name': 'Пицца "Пепперони фреш"',
        'place': 'Додо Пицца',
        'price': '359 р',
        'image': 'https://avatars.mds.yandex.net/i?id=b3d9740810e308a4c6511399ad7e2698337bfac6-7546644-images-thumbs&n=13',
      },
    ],
    'СУШИ': [
      {
        'name': 'Ролл "Флорида"',
        'place': 'Автосуши',
        'price': '365 р',
        'image': 'https://avatars.mds.yandex.net/i?id=cf71a829e0f4ae560f10d2d136528eed1bcacdd3-6637353-images-thumbs&n=13',
      },
      {
        'name': 'Ролл 4 сыра',
        'place': 'Автосуши',
        'price': '370 р',
        'image': 'https://avatars.mds.yandex.net/i?id=9eb40c26b72c30022307c9ce81953f9c8e2facef-12423753-images-thumbs&n=13',
      },
      {
        'name': 'Ролл "Джамп"',
        'place': 'Автосуши',
        'price': '290 р',
        'image': 'https://avatars.mds.yandex.net/i?id=bf9693dd7351924b9eae59abf7d4239a8fec67be-4525867-images-thumbs&n=13',
      },
      {
        'name': 'Ролл "Цезарь Темпура"',
        'place': 'Автосуши',
        'price': '310 р',
        'image': 'https://avatars.mds.yandex.net/i?id=b6667793c72d313bbd288802c758d5bdbe4007c5d907e9c8-6909092-images-thumbs&n=13',
      },
    ],
    'ДЕСЕРТЫ': [
      {
        'name': 'Тирамису',
        'place': 'Автосуши',
        'price': '235 р',
        'image': 'https://avatars.mds.yandex.net/i?id=80add6aa1500b4a296b1e1dc6dab3187c40d6aef-9229750-images-thumbs&n=13',
      },
      {
        'name': 'Чизкейк Нью-Йорк',
        'place': 'Пекарня "Сладкоежка"',
        'price': '235 р',
        'image': 'https://avatars.mds.yandex.net/i?id=c811b23c4a8dff5f06e87aa92752e6262e2cb446-9123854-images-thumbs&n=13',
      },
      {
        'name': 'Карамельный чизкейк',
        'place': 'Додо Пицца',
        'price': '179 р',
        'image': 'https://avatars.mds.yandex.net/i?id=52fbcc17e40bf0109282ee429e027911a10a1a04-4561933-images-thumbs&n=13',
      },
      {
        'name': 'Сырники',
        'place': 'Додо Пицца',
        'price': '145 р',
        'image': 'https://avatars.mds.yandex.net/i?id=cea48512e63fde7a28ff677c2f90d2fed6069b42-5065420-images-thumbs&n=13',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 45),
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(-0.30),
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(20),
                    blurRadius: 20,
                    offset: const Offset(7, 10),
                  ),
                ],
              ),
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(0.20),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 53, right: 11, left: 11),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name']!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        item['place']!,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 13,
                          color: Color(0xff646982),
                        )
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item['price']!),
                          GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 17,
                              backgroundColor: Theme.of(context).colorScheme.tertiary,
                              child: const Icon(
                                Icons.add,
                                size: 22,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 12,
          left: 12.5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              item['image'] ?? '',
              width: 122,
              height: 84,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
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