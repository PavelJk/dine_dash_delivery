import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

// Define data models
class SearchItem {
  final String name;
  final int price;
  final String placeName;
  final String image;

  SearchItem({
    required this.name,
    required this.price,
    required this.placeName,
    required this.image,
  });
}

class SearchResult {
  final String type; // 'restaurant' or 'store'
  final String name;
  final double? rating;
  final String deliveryTime;
  final List<SearchItem> items;
  final String image;

  SearchResult({
    required this.type,
    required this.name,
    this.rating,
    required this.deliveryTime,
    required this.items,
    required this.image,
  });
}

class _SearchScreenState extends State<SearchScreen> {
  int _selectedFilter = 0; // 0-Все, 1-Рестораны, 2-Магазины
  bool isClose = false;
  final TextEditingController _controller = TextEditingController();

  int _getTotalItemsCount() {
  final filteredResults = _getFilteredResults();
  int totalItems = 0;
  
  for (final result in filteredResults) {
    totalItems += result.items.length;
  }
  
  return totalItems;
}
  final List<SearchResult> searchResults = [
    SearchResult(
      type: 'restaurant',
      name: 'Пиццерия Милано',
      rating: 4.6,
      deliveryTime: '20 мин',
      image: 'https://avatars.mds.yandex.net/i?id=1cd619b20cfedad63c2c431bf8d2dcaa967b3e9c-10636727-images-thumbs&n=13',
      items: [
        SearchItem(
          name: 'Пицца По-Европейски',
          price: 820,
          placeName: 'Пиццерия Милано',
          image: 'https://avatars.mds.yandex.net/i?id=36646b8fdae77aad150df7ce9ad4d711003f7024-7946262-images-thumbs&n=13'
        ),
        SearchItem(
          name: 'Пицца По-Гавайски',
          price: 580,
          placeName: 'Пиццерия Милано',
          image: 'https://avatars.mds.yandex.net/i?id=7f399f304dcd5b8fd5686041a708b782ba3d1b02-4120589-images-thumbs&n=13'
        ),
      ],
    ),
    SearchResult(
      type: 'store',
      name: 'Магнит',
      deliveryTime: '20-25 мин',
      image: 'https://avatars.mds.yandex.net/i?id=19f91718aeeaabf9de38bf8f7439bf179354e048-4809531-images-thumbs&n=13',
      items: [
        SearchItem(
          name: 'Пицца Сибирская Коллекция 4 Сыра',
          price: 430,
          placeName: 'Магнит',
          image: 'https://avatars.mds.yandex.net/i?id=f274e83131827bea1c23d0da1fcbbe6d1ac70f3fbb1ac9af-12642203-images-thumbs&n=13'
        ),
        SearchItem(
          name: 'Пицца Цезарь с ветчиной и грибами',
          price: 300,
          placeName: 'Магнит',
          image: 'https://avatars.mds.yandex.net/i?id=113eff6399974651e57ecd2a3c89e8d9f67ed56c-11003753-images-thumbs&n=13'
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 70,
        scrolledUnderElevation: 0,
        toolbarHeight: 75,
        actionsPadding: const EdgeInsets.only(right: 24),
        title: Text(
          'Поиск',
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
          GestureDetector(
            onTap: () {
              context.goNamed(AppRoute.basket.name);
            },
            child: Stack(
              children: [
                SizedBox(
                  width: 45,
                  child: CircleAvatar(
                    radius: 29,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: SvgPicture.asset(
                      PathImages.corzina,
                      width: 24,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    child: Text(
                      '2',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              onChanged:(value) {
                setState(() {
                  if (value.isNotEmpty){
                    isClose = true;
                  }else{
                    isClose = false;
                  }
                });
              },
              decoration: InputDecoration(
                suffixIcon: isClose ? Padding(
                  padding: const EdgeInsets.all(12),
                  child: GestureDetector(
                    onTap: () {
                      _controller.clear();
                    },
                    child: CircleAvatar(radius: 1, backgroundColor: Color(0xffCDCDCF), child: Icon(Icons.close, size: 15,))),
                ) : SizedBox.shrink(),
                prefixIcon: Icon(Icons.search, color: Color(0xffA0A5BA),),
                contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 18),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 35,
              decoration: BoxDecoration(
                color: const Color(0xffF6F6F6),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xffE2E2E2)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildFilterButton('Все', 0),
                    _buildFilterButton('Рестораны', 1),
                    _buildFilterButton('Магазины', 2),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                clipBehavior: Clip.none,
                children: [
                  Text(
              'Найдено ${_getTotalItemsCount()} результатов',
              style: TextStyle(
                fontSize: 17,

              ),
            ),
            const SizedBox(height: 16),
                  ..._buildSearchResults(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String text, int index) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            setState(() {
              _selectedFilter = index;
            });
          },
          style: TextButton.styleFrom(
            backgroundColor: _selectedFilter == index
                ? Theme.of(context).colorScheme.tertiary
                : Colors.transparent,
            padding: EdgeInsets.zero,
            splashFactory: NoSplash.splashFactory,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: _selectedFilter == index ? Colors.black : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  List<SearchResult> _getFilteredResults() {
    return searchResults.where((result) {
      if (_selectedFilter == 0) return true;
      if (_selectedFilter == 1) return result.type == 'restaurant';
      if (_selectedFilter == 2) return result.type == 'store';
      return true;
    }).toList();
  }

  List<Widget> _buildSearchResults() {
    final filteredResults = _getFilteredResults();
    List<Widget> widgets = [];

    for (final result in filteredResults) {
      // Add place header vertically
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  result.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        result.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (result.rating != null) ...[
                        const SizedBox(width: 8),
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        Text(
                          result.rating.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    ],
                  ),
                  Text(
                    result.deliveryTime,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 12,
                      color: Color(0xffA09F9F)
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

      // Add items horizontally
      widgets.add(
        SizedBox(
          height: 220, // Adjust height as needed
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...result.items.map((item) => Padding(
                padding: const EdgeInsets.only(right: 14),
                child: Stack(
                  children: [
                    // Трансформированный контейнер (без изображения)
                    Padding(
                      padding: const EdgeInsets.only(top: 45),
                      child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateX(-0.30),
                        alignment: Alignment.center,
                        child: Container(
                          width: 153,
                          height: 140,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.08),
                                blurRadius: 20,
                                offset: Offset(7, 10),
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
                                    item.name,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    item.placeName,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff646982)
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${item.price} р',
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: CircleAvatar(
                                          radius: 17,
                                          backgroundColor: Theme.of(context).colorScheme.tertiary,
                                          child: Icon(
                                            Icons.add,
                                            size: 22,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Изображение поверх контейнера (не подвержено трансформации)
                    Padding(
                      padding: const EdgeInsets.only(top: 12, left: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          item.image,
                          width: 122,
                          height: 84,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              )).toList(),
            ],
          ),
        ),
      );
    }

    return widgets;
  }
}