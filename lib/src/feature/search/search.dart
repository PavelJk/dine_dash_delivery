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
  final String type;
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
  int _selectedFilter = 0;
  bool isClose = false;
  final TextEditingController _controller = TextEditingController();

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
        SearchItem(
          name: 'Бургер классика',
          placeName: 'Автосуши',
          price: 260,
          image: 'https://avatars.mds.yandex.net/i?id=51fa120a1005110d58c05487f8c20358f10e47ba-6712958-images-thumbs&n=13',
        ),
        SearchItem(
          name: 'Ролл "Флорида"',
          placeName: 'Автосуши',
          price: 365,
          image: 'https://avatars.mds.yandex.net/i?id=cf71a829e0f4ae560f10d2d136528eed1bcacdd3-6637353-images-thumbs&n=13',
        ),
        SearchItem(
          name: 'Ролл 4 сыра',
          placeName: 'Автосуши',
          price: 370,
          image: 'https://avatars.mds.yandex.net/i?id=9eb40c26b72c30022307c9ce81953f9c8e2facef-12423753-images-thumbs&n=13',
        ),
        SearchItem(
          name: 'Ролл "Джамп"',
          placeName: 'Автосуши',
          price: 290,
          image: 'https://avatars.mds.yandex.net/i?id=bf9693dd7351924b9eae59abf7d4239a8fec67be-4525867-images-thumbs&n=13',
        ),
        SearchItem(
          name: 'Ролл "Цезарь Темпура"',
          placeName: 'Автосуши',
          price: 310,
          image: 'https://avatars.mds.yandex.net/i?id=b6667793c72d313bbd288802c758d5bdbe4007c5d907e9c8-6909092-images-thumbs&n=13',
        ),
        SearchItem(
          name: 'Тирамису',
          placeName: 'Автосуши',
          price: 235,
          image: 'https://avatars.mds.yandex.net/i?id=80add6aa1500b4a296b1e1dc6dab3187c40d6aef-9229750-images-thumbs&n=13',
        ),
        SearchItem(
          name: 'Ролл "Тропик"',
          placeName: 'Автосуши',
          price: 335,
          image: 'https://avatars.mds.yandex.net/i?id=a7c9573fd92d2976d8bb7bd441f782889e2ee7fe-3691998-images-thumbs&n=13',
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
        SearchItem(
          name: 'Крепт Сюзетт',
          placeName: 'Ресторан Камелот',
          price: 330,
          image: 'https://avatars.mds.yandex.net/i?id=77f0a9e192ef42be788982f7e6cd78caec664b0c-8182695-images-thumbs&n=13',
        ),
        SearchItem(
          name: 'Греческий',
          placeName: 'Ресторан Камелот',
          price: 380,
          image: 'https://avatars.mds.yandex.net/i?id=9b0ab17ecd729153a2a29718169114d833b7b193-4545247-images-thumbs&n=13',
        ),
        SearchItem(
          name: 'Салат Пражский',
          placeName: 'Ресторан Камелот',
          price: 380,
          image: 'https://avatars.mds.yandex.net/i?id=f7ed8a38684191362cce664e93050b136c1091f4-9107083-images-thumbs&n=13',
        ),
      ],
    ),

    SearchResult(
      type: 'restaurant',
      name: 'Бургер Кинг',
      rating: 4.4,
      deliveryTime: '35 мин',
      image: 'https://avatars.mds.yandex.net/i?id=fa41e27c5f7ac00bdf09fbc23aaf2b9643684aa5-12625178-images-thumbs&n=13',
      items: [
      SearchItem(
        name: 'Воппер По-испански',
        placeName: 'Бургер Кинг',
        price: 349,
        image: 'https://avatars.mds.yandex.net/i?id=bb021288f63f43d45abbd322821c7bdd-5664298-images-thumbs&n=13',
      ),
      SearchItem(
        name: 'Чикен Тар-Тар',
        placeName: 'Бургер Кинг',
        price: 229,
        image: 'https://avatars.mds.yandex.net/i?id=e5df7be8eb79e6a90215dbea35c928b4e21a7070-12374505-images-thumbs&n=13',
      ),
      SearchItem(
        name: 'Гранд Чиз',
        placeName: 'Бургер Кинг',
        price: 259,
        image: 'https://avatars.mds.yandex.net/i?id=54d32bc6112f71dae8110a994f607fb48925b170-8220915-images-thumbs&n=13',
      ),
      SearchItem(
        name: 'Цезарь Кинг',
        placeName: 'Бургер Кинг',
        price: 139,
        image: 'https://avatars.mds.yandex.net/i?id=175092391a326d45505c54385bf91dfa7e6af092-5305527-images-thumbs&n=13',
      ),
      SearchItem(
        name: 'Шоколадный шейк',
        placeName: 'Бургер Кинг',
        price: 179,
        image: 'https://orderapp-static.burgerkingrus.ru/x256/mobile_image/368255ba2850e49cbed6a2da4da4b430.webp',
      ),
      ],
    ),
  ];

  List<SearchResult> _getFilteredResults() {
    final query = _controller.text.toLowerCase();

    return searchResults
        .where((result) {
          if (_selectedFilter == 1 && result.type != 'restaurant') return false;
          if (_selectedFilter == 2 && result.type != 'store') return false;
          return result.items.any((item) =>
              item.name.toLowerCase().contains(query));
        })
        .map((result) {
          final filteredItems = result.items
              .where((item) => item.name.toLowerCase().contains(query))
              .toList();
          return SearchResult(
            type: result.type,
            name: result.name,
            rating: result.rating,
            deliveryTime: result.deliveryTime,
            image: result.image,
            items: filteredItems,
          );
        })
        .toList();
  }

  int _getTotalItemsCount() {
    final filteredResults = _getFilteredResults();
    int totalItems = 0;

    for (final result in filteredResults) {
      totalItems += result.items.length;
    }

    return totalItems;
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
          'Поиск',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: GestureDetector(
            onTap: () => context.goNamed(AppRoute.mainHome.name),
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
            onTap: () => context.goNamed(AppRoute.basket.name),
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
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              scrolledUnderElevation: 0,
              toolbarHeight: 57,
              flexibleSpace: Column(
                children: [
                  TextField(
                    controller: _controller,
                    onChanged: (value) {
                      setState(() {
                        isClose = value.isNotEmpty;
                      });
                    },
                    decoration: InputDecoration(
                      suffixIcon: isClose
                          ? Padding(
                              padding: const EdgeInsets.all(12),
                              child: GestureDetector(
                                onTap: () {
                                  _controller.clear();
                                  setState(() {
                                    isClose = false;
                                  });
                                },
                                child: CircleAvatar(
                                  radius: 1,
                                  backgroundColor: const Color(0xffCDCDCF),
                                  child: const Icon(Icons.close, size: 15),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      prefixIcon:
                          const Icon(Icons.search, color: Color(0xffA0A5BA)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 18),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.surface,
                    ),
                  ),              
                ],
              ),
            ),
          ),
           _controller.text.isNotEmpty ?
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        child: Text(
                          'Найдено ${_getTotalItemsCount()} результатов',
                          style: const TextStyle(fontSize: 17),
                        ),
                      ),
                    ) : SliverToBoxAdapter(child: Center(child: Padding(
                      padding: const EdgeInsets.only(top: 250),
                      child: Text('Начните поиск товаров'),
                    ))),
          if (_controller.text.isNotEmpty)
            ..._getFilteredResults()
                .expand((result) => _buildSearchResultSlivers(result))
                .toList(),
        ],
      ),
    );
  }

  List<Widget> _buildItemCards(List<SearchItem> items) {
    return items.map((item) {
      return Padding(
        padding: const EdgeInsets.only(right: 14),
        child: Stack(
          children: [
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
                        color: Colors.black.withOpacity(0.08),
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
                      padding:
                          const EdgeInsets.only(top: 53, right: 11, left: 11),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 15),
                          ),
                          Text(
                            item.placeName,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff646982),
                            ),
                          ),
                          const SizedBox(height: 5),
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
                                  backgroundColor:
                                      Theme.of(context).colorScheme.tertiary,
                                  child: const Icon(
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
      );
    }).toList();
  }

  List<Widget> _buildSearchResultSlivers(SearchResult result) {
    return [
      SliverPadding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 5,),
        sliver: SliverToBoxAdapter(
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
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    ],
                  ),
                  Text(
                    result.deliveryTime,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 12,
                          color: const Color(0xffA09F9F),
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: SizedBox(
          height: 220,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 24),
            children: _buildItemCards(result.items),
          ),
        ),
      ),
    ];
  }
}

