import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/feature/home/data/data.dart';
import 'package:dine_dash_delivery/src/feature/home/model/info_restaurant.dart';
import 'package:dine_dash_delivery/src/feature/home/widgets/appbar_home_widget.dart';
import 'package:dine_dash_delivery/src/feature/home/widgets/nav_button_widget.dart';
import 'package:dine_dash_delivery/src/feature/home/widgets/prod_and_rest_button_widget.dart';
import 'package:dine_dash_delivery/src/feature/widgets/restaurant_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<String> address = ['ул. Пушкина, 15, кв. 50', 'ул. Дружбы, 89, кв. 50'];
  String? selectItem = 'ул. Пушкина, 15, кв. 50';
  late final Future<List<Restaurant>> restaurantFuture;
  late Widget newSlivreElement;

  @override
  void initState() {
    super.initState();
    restaurantFuture = getRestaurant(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Restaurant>>(
        future: restaurantFuture, 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            newSlivreElement = SliverToBoxAdapter(
              child: CircularProgressIndicator(),
            );
          }else if(snapshot.hasError){
            newSlivreElement = SliverToBoxAdapter(
              child: Text(snapshot.error.toString()),
            );
          } else if(snapshot.hasData){
            final restaurants = snapshot.data!;
            newSlivreElement = SliverList.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = restaurants[index];
                return MyRestaurantCard(
                  nameRestaurant: restaurant.nameRestaurant, 
                  menuRestaurant: restaurant.menuRestaurant, 
                  ratingRestaurant: restaurant.ratingRestaurant, 
                  deliveryRestaurant: restaurant.deliveryRestaurant, 
                  clockRestaurant: restaurant.clockRestaurant, 
                  imageRestaurant: restaurant.imageRestaurant
                );
              },
            );
          } else{
            newSlivreElement = SliverToBoxAdapter(
              child: Text(
                'Извините база данных ресторанов пуста',
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.only(right: 24, left: 24, top: 25),
            child: CustomScrollView(
              slivers: [
                MySliverAppbarHomeWidget(
                  dropdownButton: DropdownButton<String>(
                    iconEnabledColor: Theme.of(context).colorScheme.secondary,
                    underline: const SizedBox(),
                    iconSize: 26,
                    isDense: true,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    dropdownColor: Theme.of(context).colorScheme.onTertiary,
                    value: selectItem,
                    items: address.map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          item,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    )).toList(),
                    onChanged: (item) => setState(() => selectItem = item),
                  ),
                ),
                SliverPadding(padding: EdgeInsets.all(20)),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Добрый день, ',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Павел!',
                            style: Theme.of(context).textTheme.bodyMedium
                          ),
                        ],
                      ),
                    ]
                  )
                ),
                SliverPadding(padding: EdgeInsets.all(10)),
                SliverAppBar(
                  pinned: true,
                  scrolledUnderElevation: 0,
                  automaticallyImplyLeading: false,
                  toolbarHeight: 40,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyNavButtonWidget(
                          onTap: () {
                            
                          },
                          text: 'Поиск',
                          iconName: PathImages.search,
                        ),
                        SizedBox(width: 25,),
                        MyNavButtonWidget(
                          onTap: () {
                            
                          },
                          text: 'Рецепты',
                          iconName: PathImages.video,
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProdAndRestButtonWidget(
                        text: 'Продукты', 
                        nameImage: PathImages.product,
                        onTap: () {
                          
                        }
                      ),
                      ProdAndRestButtonWidget(
                        text: 'Рестораны', 
                        nameImage: PathImages.restoran,
                        onTap: () {
                          
                        },
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Рестораны',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: TextButton.icon(
                        onPressed: () {
                          
                        },
                        label: Text(
                          'Смотреть все',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        icon: Padding(
                          padding: const EdgeInsets.only(top: 2.5),
                          child: SvgPicture.asset(
                            PathImages.forward,
                          ),
                        ),
                        iconAlignment: IconAlignment.end,
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          splashFactory: NoSplash.splashFactory,
                          enableFeedback: false,
                        ),
                      ),
                    ),
                  ],
                ),
                ),
                newSlivreElement,
              ],
            ),
          );
        },
      )
    );
  }
}

