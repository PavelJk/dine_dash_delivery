import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteItems = [
    {
      'title': 'Пицца По-Европейски',
      'restaurant': 'Пиццерия Милано',
      'price': 820,
      'image': 'assets/pizza_european.jpg',
    },
    {
      'title': 'Суп Борщ',
      'restaurant': 'White Rabbit',
      'price': 600,
      'image': 'assets/borscht.jpg',
    },
    {
      'title': 'Грибной Суп',
      'restaurant': 'White Rabbit',
      'price': 700,
      'image': 'assets/mushroom_soup.jpg',
    },
    {
      'title': 'Бургер Бивстро',
      'restaurant': 'Розовый Сад',
      'price': 340,
      'image': 'assets/burger.jpg',
    },
    {
      'title': 'Пицца Милано',
      'restaurant': 'Пиццерия Милано',
      'price': 580,
      'image': 'assets/pizza_milano.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        scrolledUnderElevation: 0,
        toolbarHeight: 75,
        actionsPadding: EdgeInsets.only(right: 24),
        title: Text(
          'Избранное',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 18
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: GestureDetector(
            onTap: (){
              context.pop('value');
            },
            child: CircleAvatar(
              backgroundColor: Color(0xffECF0F4),
              child: Padding(
                padding: const EdgeInsets.only(right: 1),
                child: SvgPicture.asset(
                  PathImages.back,
                  width: 8,
                  colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Количество элементов в ряду
          crossAxisSpacing: 10, // Горизонтальный отступ между элементами
          mainAxisSpacing: 10, // Вертикальный отступ между элементами
          childAspectRatio: 0.8, // Соотношение ширины к высоте элемента
        ),
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          final item = favoriteItems[index];
          return _buildFavoriteItem(item);
        },
      ),
    );
  }
  }

  Widget _buildFavoriteItem(Map<String, dynamic> item) {
  return Stack(
    children: [
      // Трансформированный контейнер (без изображения)
      Padding(
        padding: const EdgeInsets.only(right: 0, left: 0, top: 40, bottom: 20),
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(-0.30),
          alignment: Alignment.center,
          child: Container(
            width: 153,
            height: 130,
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
          ),
        ),
      ),
      // Изображение поверх контейнера (не подвержено трансформации)
      
      Positioned(
        left: (153 - 122) / 2, 
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            'https://avatars.mds.yandex.net/i?id=4a9bfb26ce9f230a45e26f9eb907349c762da253-10245136-images-thumbs&n=13',
            width: 122,
            height: 84,
          ),
        ),
      ),
      Positioned(
        left: 125,
        child: CircleAvatar(
          radius: 15,
          backgroundColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.only(left: 1, top: 1),
            child: Icon(
              Icons.favorite,
              size: 18,
              color: Colors.red,
            ),
          ),
        )
      ),
    ],
  );
}

