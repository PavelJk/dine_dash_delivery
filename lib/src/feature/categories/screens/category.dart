import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final ScrollController _scrollController = ScrollController();

  final List<Categories> categories = [
    Categories('Блюда', 'Бургеры',
        'https://emojigraph.org/media/apple/hamburger_1f354.png'),
    Categories('Блюда', 'Суши',
        'https://emojigraph.org/media/google/sushi_1f363.png'),
    Categories('Блюда', 'Десерты',
        'https://emojigraph.org/media/google/shortcake_1f370.png'),
    Categories('Блюда', 'Пицца',
        'https://emojigraph.org/media/joypixels/pizza_1f355.png'),
    Categories('Блюда', 'Салаты',
        'https://emojigraph.org/media/google/green-salad_1f957.png'),
  ];

  // Группируем категории
  Map<String, List<Categories>> get groupedCategories {
    final map = <String, List<Categories>>{};
    for (var category in categories) {
      if (!map.containsKey(category.category)) {
        map[category.category] = [];
      }
      map[category.category]!.add(category);
    }
    return map;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        scrolledUnderElevation: 0,
        toolbarHeight: 75,
        actionsPadding: const EdgeInsets.only(right: 24),
        title: Text(
          'Все категории',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w400, fontSize: 18),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: GestureDetector(
            onTap: () => context.goNamed(AppRoute.mainHome.name),
            child: CircleAvatar(
              backgroundColor: const Color(0xffECF0F4),
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
            onTap: () {
              context.goNamed(AppRoute.search.name);
            },
            child: CircleAvatar(
              radius: 22,
              backgroundColor: const Color(0xff181C2E),
              child: SvgPicture.asset(
                PathImages.search,
                width: 15,
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        itemCount: groupedCategories.length,
        itemBuilder: (context, index) {
          final categoryKey = groupedCategories.keys.elementAt(index);
          final items = groupedCategories[categoryKey]!;
          
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Заголовок категории
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  categoryKey,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Сетка элементов
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return _buildCategoryItem(items[index]);
                },
              ),
              const SizedBox(height: 24),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCategoryItem(Categories category) {
    return Card(
      color: const Color(0xffF6F6F6),
      elevation: 3,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          context.goNamed(
            AppRoute.menuCategories.name,
            pathParameters:{
              "hor" : category.name.toUpperCase(),
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                category.image,
                fit: BoxFit.cover,
                height: 45,
              ),
              const SizedBox(height: 8),
              Text(
                category.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Categories {
  final String category;
  final String name;
  final String image;

  Categories(this.category, this.name, this.image);
}