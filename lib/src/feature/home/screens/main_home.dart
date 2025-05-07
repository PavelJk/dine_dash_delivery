import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/home/data/data.dart';
import 'package:dine_dash_delivery/src/feature/home/model/info_restaurant.dart';
import 'package:dine_dash_delivery/src/feature/home/widgets/appbar.dart';
import 'package:dine_dash_delivery/src/feature/home/widgets/nav_card_button.dart';
import 'package:dine_dash_delivery/src/feature/home/widgets/section_header.dart';
import 'package:dine_dash_delivery/src/feature/setting/screens/nav_menu.dart';
import 'package:dine_dash_delivery/src/feature/widgets/restaurant_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  final GlobalKey<ScaffoldState> _openDraver = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();
    restaurantFuture = getRestaurant(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _openDraver,
      drawer: AppDrawer(),
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
            padding: EdgeInsets.only(right: 16, left: 16, top: 50, bottom: 5),
            child: CustomScrollView(
              slivers: [
                MyFirstHomeSliverAppbar(
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
                        padding: const EdgeInsets.only(right: 2),
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
                  onTap: () {
                    setState(() {
                      _openDraver.currentState?.openDrawer();
                    });
                  },
                ),
                SliverPadding(padding: EdgeInsets.all(10)),
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
                SliverPadding(padding: EdgeInsets.all(2)),
                MySecondNavHomeSliverAppBar(),
                SliverPadding(padding: EdgeInsets.all(11)),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NavCardHomeButton(
                        text: 'Продукты', 
                        nameImage: PathImages.product,
                        onTap: () {
                          
                        }
                      ),
                      NavCardHomeButton(
                        text: 'Рестораны', 
                        nameImage: PathImages.restoran,
                        onTap: () {
                          context.goNamed(AppRoute.restaurantHome.name);
                        },
                      ),
                    ],
                  ),
                ),
                SliverPadding(padding: EdgeInsets.all(9)),
                SliverToBoxAdapter(
                  child: MySectionHeadersHome(
                    text: 'Рестораны'
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

