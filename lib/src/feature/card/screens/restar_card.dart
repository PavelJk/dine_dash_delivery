import 'package:carousel_slider/carousel_slider.dart';
import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/widgets/product_card.dart';
import 'package:dine_dash_delivery/src/feature/widgets/restaurant_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class RestaurantDetailPage extends StatefulWidget {
  final String nameRest;
  final String rating;
  final String deliver;
  final String clock;


  const RestaurantDetailPage({super.key, required this.nameRest, required this.rating, required this.deliver, required this.clock});

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {

  final Map<String, List<String>> _restaurantImages = {
    'Бургер Кинг': [
      'https://avatars.mds.yandex.net/i?id=708358ecda1808bed986e190f023cacdc4584976-8185042-images-thumbs&n=13',
      'https://avatars.mds.yandex.net/i?id=b4a26b194b2761e77ef4deae0e1f2dbb7f5bed28-10778769-images-thumbs&n=13',
      'https://avatars.mds.yandex.net/i?id=d98e242dbde5bab4de41dcdd34c99680f5188145-12529777-images-thumbs&n=13',
      'https://avatars.mds.yandex.net/i?id=6cf76b62875be6799cd781bfe59a557e3b2371e9-5302491-images-thumbs&n=13',
      'https://avatars.mds.yandex.net/i?id=fa41e27c5f7ac00bdf09fbc23aaf2b9643684aa5-12625178-images-thumbs&n=13',
    ],
    'Автосуши': [
      'https://avatars.mds.yandex.net/i?id=75b440b7e11f2e3b21276dd78caa7b2d03be53dc-7545494-images-thumbs&n=13',
      'https://avatars.mds.yandex.net/i?id=f8d656d8d3dac3a34a342090a29bf8d450691d29-12500642-images-thumbs&n=13',
      'https://avatars.mds.yandex.net/i?id=357fbc3933f8d8cc9303940e1f725a72ff457d82-5278228-images-thumbs&n=13',
      'https://avatars.mds.yandex.net/i?id=6e9178701a2b863bf4fc496b84ca117b05b3456a-5869703-images-thumbs&n=13',
      'https://avatars.mds.yandex.net/i?id=5b5a85ece7590631b30f89b5cf699c5bb29266ac-5220454-images-thumbs&n=13',
    ],
    'Ресторан Камелот': [
      'https://avatars.mds.yandex.net/i?id=2d8e64c4af79f7eb38ec45b3b50e9fa171acf2e8-10754985-images-thumbs&n=13',
      'https://avatars.mds.yandex.net/i?id=f23d1732e1a26a6121607c9f2ae9cb81fd97626e-10232965-images-thumbs&n=13',
      'https://avatars.mds.yandex.net/i?id=f65fb4c23f38600ecbab9019063ced46d57af631-4146491-images-thumbs&n=13',
      'https://avatars.mds.yandex.net/i?id=2cc7e16ec11e31cbab059d139ef32f28a9f4c9f0-7551603-images-thumbs&n=13',
      'https://avatars.mds.yandex.net/i?id=18af497c46a0b1ea6cc2afb4751bcff3f3c4bf64-5487972-images-thumbs&n=13',
    ],
  };

  final Map<String, String> _restaurantDescriptions = {
    'Бургер Кинг': 'Бургер Кинг — это царство сочных бургеров, где каждый сэндвич создается с королевским размахом. Это место, где вкус побеждает голод, а сочность и аромат остаются в памяти надолго.',
    'Автосуши': 'Автосуши — это современный взгляд на японскую кухню, где свежесть риса, нежность рыбы и яркие акценты соусов создают идеальные роллы.',
    'Ресторан Камелот': 'Ресторан Камелот — это средневековое пиршество в современном формате. Здесь подают блюда, достойные королевского стола: сочное мясо на гриле, ароматные супы в хлебных горшочках и сытные гарниры.',
  };

  final Map<String, List<CardFavorites>> _categoryItems = {
    'Бургеры': [
      CardFavorites(
        title: 'Воппер По-испански',
        restaurant: 'Бургер Кинг',
        price: '349',
        image: 'https://avatars.mds.yandex.net/i?id=5cd7767cd13d73d2ecaf804373ea992fdcffd804-12658900-images-thumbs&n=13',
      ),
      CardFavorites(
        title: 'Чикен Тар-Тар',
        restaurant: 'Бургер Кинг',
        price: '229',
        image: 'https://avatars.mds.yandex.net/i?id=e5df7be8eb79e6a90215dbea35c928b4e21a7070-12374505-images-thumbs&n=13',
      ),
      CardFavorites(
        title: 'Гранд Чиз',
        restaurant: 'Бургер Кинг',
        price: '259',
        image: 'https://avatars.mds.yandex.net/i?id=54d32bc6112f71dae8110a994f607fb48925b170-8220915-images-thumbs&n=13',
      ),
      CardFavorites(
        title: 'Бургер классика',
        restaurant: 'Автосуши',
        price: '260',
        image: 'https://avatars.mds.yandex.net/i?id=51fa120a1005110d58c05487f8c20358f10e47ba-6712958-images-thumbs&n=13',
      ),
      CardFavorites(
        title: 'Цезарь Кинг',
        restaurant: 'Бургер Кинг',
        price: '139',
        image: 'https://avatars.mds.yandex.net/i?id=175092391a326d45505c54385bf91dfa7e6af092-5305527-images-thumbs&n=13',
      ),
    ],
    'Пицца': [
      CardFavorites(
        title: 'Пицца "Микс"',
        restaurant: 'Автосуши',
        price: '660',
        image: 'https://avatars.mds.yandex.net/i?id=909efe3f0bfc6e5c8fbcbbce988c9b6fe0619846-5292008-images-thumbs&n=13',
      ),
      CardFavorites(
        title: 'Пицца с томатами и ветчиной',
        restaurant: 'Ресторан Камелот',
        price: '500',
        image: 'https://avatars.mds.yandex.net/i?id=8827a09d0e016286baa7de68f9cf42a286925d92-5886703-images-thumbs&n=13',
      ),
      CardFavorites(
        title: 'Пицца "Ямайка с креветками"',
        restaurant: 'Автосуши',
        price: '415',
        image: 'https://avatars.mds.yandex.net/i?id=3727e843a8163f70f249fbebe83873f6df1ecf70-5348428-images-thumbs&n=13',
      ),
      CardFavorites(
        title: 'Пицца "Пепперони"',
        restaurant: 'Автосуши',
        price: '345',
        image: 'https://avatars.mds.yandex.net/i?id=23dea17c9cee7d1d1ff9e3e30194452943d711af-5222634-images-thumbs&n=13',
      ),
    ],
    'Суши': [
      CardFavorites(
        title: 'Ролл "Флорида"',
        restaurant: 'Автосуши',
        price: '365',
        image: 'https://avatars.mds.yandex.net/i?id=cf71a829e0f4ae560f10d2d136528eed1bcacdd3-6637353-images-thumbs&n=13',
      ),
      CardFavorites(
        title: 'Ролл 4 сыра',
        restaurant: 'Автосуши',
        price: '370',
        image: 'https://avatars.mds.yandex.net/i?id=9eb40c26b72c30022307c9ce81953f9c8e2facef-12423753-images-thumbs&n=13',
      ),
      CardFavorites(
        title: 'Ролл "Джамп"',
        restaurant: 'Автосуши',
        price: '290',
        image: 'https://avatars.mds.yandex.net/i?id=bf9693dd7351924b9eae59abf7d4239a8fec67be-4525867-images-thumbs&n=13',
      ),
      CardFavorites(
        title: 'Ролл "Цезарь Темпура"',
        restaurant: 'Автосуши',
        price: '310',
        image: 'https://avatars.mds.yandex.net/i?id=b6667793c72d313bbd288802c758d5bdbe4007c5d907e9c8-6909092-images-thumbs&n=13',
      ),
    ],
    'Десерты': [
      CardFavorites(
        title: 'Тирамису',
        restaurant: 'Автосуши',
        price: '235',
        image: 'https://avatars.mds.yandex.net/i?id=80add6aa1500b4a296b1e1dc6dab3187c40d6aef-9229750-images-thumbs&n=13',
      ),
      CardFavorites(
        title: 'Шоколадный шейк',
        restaurant: 'Бургер Кинг',
        price: '179',
        image: 'https://orderapp-static.burgerkingrus.ru/x256/mobile_image/368255ba2850e49cbed6a2da4da4b430.webp',
      ),
      CardFavorites(
        title: 'Крепт Сюзетт',
        restaurant: 'Ресторан Камелот',
        price: '330',
        image: 'https://avatars.mds.yandex.net/i?id=77f0a9e192ef42be788982f7e6cd78caec664b0c-8182695-images-thumbs&n=13',
      ),
      CardFavorites(
        title: 'Ролл "Тропик"',
        restaurant: 'Автосуши',
        price: '335',
        image: 'https://avatars.mds.yandex.net/i?id=a7c9573fd92d2976d8bb7bd441f782889e2ee7fe-3691998-images-thumbs&n=13',
      ),
    ],
    'Салаты': [
      CardFavorites(
        title: 'Греческий',
        restaurant: 'Ресторан Камелот',
        price: '380',
        image: 'https://avatars.mds.yandex.net/i?id=9b0ab17ecd729153a2a29718169114d833b7b193-4545247-images-thumbs&n=13',
      ),
      CardFavorites(
        title: 'Салат Пражский',
        restaurant: 'Ресторан Камелот',
        price: '380',
        image: 'https://avatars.mds.yandex.net/i?id=f7ed8a38684191362cce664e93050b136c1091f4-9107083-images-thumbs&n=13',
      ),
    ],
  };

  final Map<String, List<String>> _categories = {
    'Бургер Кинг': ['Бургеры', 'Десерты'],
    'Автосуши': ['Пицца', 'Суши', 'Бургеры', 'Десерты'],
    'Ресторан Камелот': ['Пицца', 'Десерты', 'Салаты'],
  };
    // Получаем описание ресторана по его имени
  String get _restaurantDescription {
    return _restaurantDescriptions[widget.nameRest] ?? 
           '${widget.nameRest} — это уютное заведение с вкусной кухней и приятной атмосферой.';
  }

  List<String> get categories {
    return _categories[widget.nameRest] ?? ['Бургеры', 'Пицца', 'Суши', 'Десерты'];
  }

  List<CardFavorites> _getFilteredItems(String category) {
    final allItems = _categoryItems[category] ?? [];
    return allItems.where((item) => item.restaurant == widget.nameRest).toList();
  }

    // Получаем изображения для текущего ресторана
  List<String> get _currentRestaurantImages {
    return _restaurantImages[widget.nameRest] ?? [
      '',
      '',
    ];
  }

  int _currentIndex = 0;
  int _selectedCategoryIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final currentCategory = categories[_selectedCategoryIndex];
    final currentItems = _getFilteredItems(currentCategory);
    print(currentItems);
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                _buildImageSliderWithOverlay(),
                Positioned(
                  top: 50,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: GestureDetector(
                      onTap: () => context.goNamed(
                        AppRoute.menuCategories.name,
                        pathParameters:{
                          "hor" : "РЕСТОРАНЫ",
                        }, 
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25,
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
                ),
                Positioned(
                  bottom: 7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _currentRestaurantImages.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 19,
                          height: 19,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(
                              color: _currentIndex == entry.key
                                  ? Colors.white
                                  : Colors.transparent,
                            )
                          ),
                          child: Container(
                            width: 8,
                            height: 8,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == entry.key
                                  ? Colors.white
                                  : Colors.white.withValues(alpha:  0.5),
                              border: _currentIndex == entry.key
                                  ? Border.all(color: Colors.white, width: 2)
                                  : null,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    MyDescriptionRestaurant(
                      nameIcon: PathImages.star,
                      text: widget.rating,
                      isBoldStyleText: true,
                    ),
                    MyDescriptionRestaurant(
                      nameIcon: PathImages.delivery,
                      text: widget.deliver,
                      isBoldStyleText: false,
                    ),
                    MyDescriptionRestaurant(
                      nameIcon: PathImages.clock,
                      text: widget.clock,
                      isBoldStyleText: false,
                    ),
                  ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.nameRest,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _restaurantDescription,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: const Color(0xffA0A5BA)
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Горизонтальный ListView для категорий
                  SizedBox(
                    height: 46,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedCategoryIndex = index;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(33),
                                color: _selectedCategoryIndex == index 
                                    ? const Color(0xFFFFD700)
                                    : Colors.transparent,
                                border: Border.all(
                                  color: const Color(0xffEDEDED),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  categories[index],
                                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                    fontSize: 16,
                                    color:  Colors.black
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  if (currentItems.isNotEmpty)
                    Text(
                      '$currentCategory (${currentItems.length})',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontSize: 20,
                      ),
                    ),

                   if (currentItems.isNotEmpty)
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: currentItems.length,
                      itemBuilder: (context, index) {
                        final item = currentItems[index];
                        return _buildFavoriteItem(item);
                      },
                    ),
                    if (currentItems.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 50),
                        child: Text('Нет доступных блюд в этой категории'),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteItem(CardFavorites item) {
    return MyCustonCardProduct(
      name: item.title,
      place: item.restaurant, 
      price: item.price, 
      image: item.image,
    );
  }

  Widget _buildImageSliderWithOverlay() {
    return Stack(
      children: [
        _buildImageSlider(),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: MediaQuery.of(context).size.height * 0.23,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha:  0.9),
                  Colors.transparent,
                ],
                stops: const [0.0, 1],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImageSlider() {
    return CarouselSlider(
      carouselController: _controller,
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.4,
        aspectRatio: 16/9,
        viewportFraction: 1,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      items: _currentRestaurantImages.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                image: DecorationImage(
                  image: NetworkImage(url),
                  fit: BoxFit.fill,
                  
                ),
              ),
            );
          },
        );
      }).toList(),
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
    required this.restaurant,
    required this.price,
    required this.image,
  });
}