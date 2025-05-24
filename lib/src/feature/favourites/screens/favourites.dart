import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class FavoritesScreen extends StatefulWidget {

  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {

  final List<CardFavorites> product = [
      CardFavorites(
        title: 'Салат Пражский',
        restaurant : 'Ресторан Камелот',
        image: 'https://avatars.mds.yandex.net/i?id=f7ed8a38684191362cce664e93050b136c1091f4-9107083-images-thumbs&n=13',
        price: '380',
      ),
      CardFavorites(
        title: 'Ролл "Флорида"',
        restaurant : 'Автосуши',
        image: 'https://avatars.mds.yandex.net/i?id=cf71a829e0f4ae560f10d2d136528eed1bcacdd3-6637353-images-thumbs&n=13',
        price: '365',
      ),
      CardFavorites(
        title: 'Пицца "Пепперони"',
        restaurant : 'Автосуши',
        image: 'https://avatars.mds.yandex.net/i?id=23dea17c9cee7d1d1ff9e3e30194452943d711af-5222634-images-thumbs&n=13',
        price: '345',
      ),
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
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Количество элементов в ряду
          crossAxisSpacing: 10, // Горизонтальный отступ между элементами
          childAspectRatio: 0.8, // Соотношение ширины к высоте элемента
        ),
        itemCount: product.length,
        itemBuilder: (context, index) {
          final item = product[index];
          return _buildFavoriteItem(item);
        },
      ),
    );
  }

  Widget _buildFavoriteItem(CardFavorites item) {
  return Stack(
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
                      item.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      item.restaurant,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff646982)
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${item.price} р',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        GestureDetector(
                          onTap: () {
                            
                          },
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
      Positioned(
        left: 122,
        child: GestureDetector(
          onTap: () {
            setState(() {
              product.remove(item);
            });
          },
          child: CircleAvatar(
            radius: 17,
            backgroundColor: Colors.black,
            child: Padding(
              padding: const EdgeInsets.only(left: 1, top: 1),
              child: Icon(
                Icons.favorite,
                size: 18,
                color: Colors.red,
              ),
            ),
          ),
        )
      ),
    ],
  );
}
}


class CardFavorites {
  final String title;
  final String restaurant;
  final String price;
  final String image;

  CardFavorites({
    required this.title,
    required this.price,
    required this.image,
     required this.restaurant,
  });
}