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
      name: 'Автосуши',
      rating: 4.7,
      deliveryTime: '20 мин',
      image: 'https://avatars.mds.yandex.net/i?id=de94162a6ff6f4647aa03c43b06456303efd5cc3-9842162-images-thumbs&n=13',
      items: [
        SearchItem(
        name: 'Пицца "Микс"',
        placeName: 'Автосуши',
        price: 660,
        image: 'https://avatars.mds.yandex.net/i?id=909efe3f0bfc6e5c8fbcbbce988c9b6fe0619846-5292008-images-thumbs&n=13',
      ),
            SearchItem(
        name: 'Пицца "Ямайка с креветками"',
        placeName: 'Автосуши',
        price: 415,
        image: 'https://avatars.mds.yandex.net/i?id=3727e843a8163f70f249fbebe83873f6df1ecf70-5348428-images-thumbs&n=13',
      ),
      SearchItem(
        name: 'Пицца "Пепперони"',
        placeName: 'Автосуши',
        price: 345,
        image: 'https://avatars.mds.yandex.net/i?id=23dea17c9cee7d1d1ff9e3e30194452943d711af-5222634-images-thumbs&n=13',
      ),
      ],
    ),
    SearchResult(
      type: 'restaurant',
      name: 'Ресторан Камелот',
      rating: 5.0,
      deliveryTime: '40 мин',
      image: 'https://avatars.mds.yandex.net/i?id=c2c5c0176b1cc7200f999175d100344c88d08186-8438802-images-thumbs&n=13',
      items: [
        SearchItem(
        name: 'Пицца с томатами и ветчиной',
        placeName: 'Ресторан Камелот',
        price: 500,
        image: 'https://avatars.mds.yandex.net/i?id=8827a09d0e016286baa7de68f9cf42a286925d92-5886703-images-thumbs&n=13',
      ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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