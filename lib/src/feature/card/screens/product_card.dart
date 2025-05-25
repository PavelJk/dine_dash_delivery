import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/feature/widgets/main_button.dart';
import 'package:dine_dash_delivery/src/feature/widgets/restaurant_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ProductDetailScreen extends StatefulWidget {
  final String nameProduct;
  final String nameRest;
  final String price;
  final String image;



  const ProductDetailScreen({super.key, required this.nameRest, required this.nameProduct, required this.price, required this.image});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {


  final Map<String, String> _restaurantDescriptions = {
    'Воппер По-испански': 'Состав: Говяжья котлета, испанский хлеб чоризо, сыр манчего, салат романо, помидоры, лук, соус чимичурри.',
    'Чикен Тар-Тар': 'Состав: Куриное филе-гриль, свежий багет, листья салата айсберг, помидоры черри, красный лук, соус тар-тар (яичный желток, горчица, каперсы, укроп, лимонный сок), картофель фри.',
    'Гранд Чиз': 'Состав: Две говяжьи котлеты, сыр чеддер, сыр эмменталь, сыр гауда, карамелизированный лук, соус гриль.',
    'Бургер классика': 'Состав: Говяжья котлета, булочка бриошь, лист салата, помидор, красный лук, соленые огурчики, соус бургер.',
    'Цезарь Кинг': 'Состав: Куриное филе-гриль, листья романо, пармезан, крутоны, соус цезарь, анчоусы.',
    'Пицца "Микс"': 'Состав: Томатный соус, моцарелла, ветчина, пепперони, шампиньоны, маслины, болгарский перец.',
    'Пицца с томатами и ветчиной': 'Состав: Томатный соус, моцарелла, ветчина, черри, руккола, пармезан.',
    'Пицца "Ямайка с креветками"': 'Состав: Сливочный соус, тигровые креветки, ананас, перец халапеньо, моцарелла, кинза.',
    'Пицца "Пепперони"': 'Состав: Томатный соус, пепперони, моцарелла, орегано, чили-хлопья.',
    'Ролл "Флорида"': 'Состав: Рис, нори, лосось, огурец, авокадо, сливочный сыр, икра тобико.',
    'Ролл 4 сыра': 'Состав: Рис, нори, сливочный сыр, пармезан, дор блю, моцарелла, трюфельное масло.',
    'Ролл "Джамп"': 'Состав: Рис, нори, угорь, огурец, спайси-соус, кунжут, стружка тунца.',
    'Ролл "Цезарь Темпура"': 'Состав: Рис, нори, курица темпура, салат айсберг, соус цезарь, пармезан.',
    'Тирамису': 'Состав: Песочный бисквит, кофейная пропитка, сыр маскарпоне, какао-порошок, ликёр амаретто.',
    'Шоколадный шейк': 'Состав: Молочная основа, шоколадный сироп, мороженое, взбитые сливки, шоколадная крошка.',
    'Крепт Сюзетт': 'Состав: Тонкие блинчики, апельсиновый курд, коньяк, сливочное масло, сахарная пудра.',
    'Ролл "Тропик"': 'Состав: Рис, нори, креветка, манго, огурец, спайси-соус, кокосовая стружка.',
    'Греческий': 'Состав: Помидоры, огурцы, красный лук, фета, маслины, оливковое масло, орегано.',
    'Салат Пражский': 'Состав: Куриное филе-гриль, ветчина, сыр, яйцо, картофель, майонез, зелень.',
  };

  

  final Map<String, List<String>> _info = {
    'Бургер Кинг': ['4.4', 'бесплатно', '35 мин'],
    'Автосуши': ['4.7', 'бесплатно', '20 мин'],
    'Ресторан Камелот': ['5.0', 'бесплатно', '40 мин'],
  };
    // Получаем описание ресторана по его имени
  String get _restaurantDescription {
    return _restaurantDescriptions[widget.nameProduct] ?? widget.nameProduct;
  }

  List<String> get info {
    return _info[widget.nameRest] ?? ['', '', '',];
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  String get _totalPrice {
    // Преобразуем строку цены в число (убираем " руб." если есть)
    final priceString = widget.price.replaceAll(' руб.', '').trim();
    final price = double.tryParse(priceString) ?? 0;
    final total = price * _quantity;
    return '${total.toStringAsFixed(0)} руб.'; // Округляем до целых
  }

  bool isFavorites = false;
  int _quantity = 1;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
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
                    onTap: () => context.pop(),
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
                top: 50,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorites = !isFavorites;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Icon(
                          Icons.favorite,
                          size: 22,
                          color: isFavorites ? Color(0xffFF0000) : Color(0xff9B9998),
                        ),
                      )
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.nameProduct,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Image.asset(
                      PathImages.restarnamePro,
                      width: 22,
                      height: 22,
                    ),
                    SizedBox(width: 10,),
                    Text(
                      widget.nameRest,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  MyDescriptionRestaurant(
                    nameIcon: PathImages.star,
                    text: info[0],
                    isBoldStyleText: true,
                  ),
                  MyDescriptionRestaurant(
                    nameIcon: PathImages.delivery,
                    text: info[1],
                    isBoldStyleText: false,
                  ),
                  MyDescriptionRestaurant(
                    nameIcon: PathImages.clock,
                    text: info[2],
                    isBoldStyleText: false,
                  ),
                ],
                ),
                const SizedBox(height: 20),
                Text(
                  _restaurantDescription,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: const Color(0xffA0A5BA)
                  ),
                ), 
          
              ],
            ),
          ),
          Spacer(),
          Container(
                  width: double.infinity,
                  height: 184,
                  decoration: BoxDecoration(
                    color: Color(0xffF0F5FA)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _totalPrice,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontSize: 28,
                              ),
                            ),
                            Container(
                              width: 125,
                              height: 48,
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                color: Color(0xff121223),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: _decrementQuantity,
                                    child: const CircleAvatar(
                                      radius: 11,
                                      backgroundColor: Color.fromARGB(57, 255, 255, 255),
                                      child: Icon(
                                        Icons.remove,
                                        size: 17,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '$_quantity',
                                    style: const TextStyle(fontSize: 16, color: Colors.white),
                                  ),
                                  GestureDetector(
                                    onTap: _incrementQuantity,
                                    child: const CircleAvatar(
                                      radius: 11,
                                      backgroundColor: Color.fromARGB(57, 255, 255, 255),
                                      child: Icon(
                                        Icons.add,
                                        size: 17,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        MyCustomMainButton(
                          onPressed: (){
                            
                          }, 
                          text: 'В КОРЗИНУ'
                        )
                      ],
                    ),
                  ),
                ),
        ],
      ),
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
    return Container(
              width: MediaQuery.of(context).size.width,
              height: 321,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.fill,
                  
                ),
              ),
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