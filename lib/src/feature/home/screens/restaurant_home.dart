import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/feature/home/data/data.dart';
import 'package:dine_dash_delivery/src/feature/home/model/categorie_dish.dart';
import 'package:dine_dash_delivery/src/feature/home/model/info_restaurant.dart';
import 'package:dine_dash_delivery/src/feature/home/widgets/appbar.dart';
import 'package:dine_dash_delivery/src/feature/home/widgets/section_header.dart';
import 'package:dine_dash_delivery/src/feature/widgets/restaurant_card.dart';
import 'package:flutter/material.dart';


class RestaurantHomeScreen extends StatefulWidget {
  const RestaurantHomeScreen({super.key});

  @override
  State<RestaurantHomeScreen> createState() => _RestaurantHomeScreenState();
}

class _RestaurantHomeScreenState extends State<RestaurantHomeScreen> {
  
  List<String> address = ['ул. Пушкина, 15, кв. 50', 'ул. Дружбы, 89, кв. 50'];
  String? selectItem = 'ул. Пушкина, 15, кв. 50';
  late final Future<List<Restaurant>> restaurantFuture;
  late final Future<List<CategorieDish>> categorieDishFuture;
  late Widget newSlivreElement;
  late Widget newSlivreElement2;

  @override
  void initState() {
    super.initState();
    restaurantFuture = getRestaurant(context);
    categorieDishFuture = getCategorieDish(context);
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
                ),
                MySecondNavHomeSliverAppBar(),
                SliverToBoxAdapter(
                  child: MySectionHeadersHome(
                    text: 'Категории',
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 5,),),
                SliverToBoxAdapter(
                  child: FutureBuilder<List<CategorieDish>>(
                    future: categorieDishFuture,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final categorieDishs = snapshot.data!;
                        return SizedBox(
                          height: 60,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            clipBehavior: Clip.none,
                            itemCount: categorieDishs.length,
                            itemBuilder: (context, index){
                              final categorie = categorieDishs[index];
                              return Padding(
                                padding: const EdgeInsets.only(right: 13),
                                child: GestureDetector(
                                  onTap: () {
                                    
                                  },
                                  child: Container(
                                    width: index == 0 ? 103 : 135,
                                    decoration: BoxDecoration(
                                      color: index == 0 ? Color(0xffFFD27C) : Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromARGB(255, 241, 241, 241),
                                          offset: const Offset(5.0, 4.0,),
                                          blurRadius: 8,
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 22,
                                            backgroundColor: Theme.of(context).colorScheme.onSecondary,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(30),
                                              child: Image.network(
                                                categorie.iconDish,
                                                fit: BoxFit.cover,
                                                height: 33,
                                                
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 9,),
                                          Text(
                                            categorie.nameDish,
                                            style: Theme.of(context).textTheme.labelMedium,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          ),
                        );
                      }else{
                        return Text(
                          'Извините база данных ресторанов пуста',
                        );
                      }
                    },
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 15,),),
                SliverToBoxAdapter(
                  child: MySectionHeadersHome(
                    text: 'Рестораны',
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
