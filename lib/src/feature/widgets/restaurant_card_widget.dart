import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyRestaurantCard extends StatelessWidget {

  final String nameRestaurant;
  final String menuRestaurant;
  final String ratingRestaurant;
  final String deliveryRestaurant;
  final String clockRestaurant;
  final String imageRestaurant;
  final void Function()? onTap;

  const MyRestaurantCard({
    super.key, 
    required this.nameRestaurant, 
    required this.menuRestaurant, 
    required this.ratingRestaurant, 
    required this.deliveryRestaurant, 
    required this.clockRestaurant, 
    required this.imageRestaurant, 
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                  imageRestaurant,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 137,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffDBDBDB)),
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nameRestaurant,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          menuRestaurant,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Color(0xffA0A5BA),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            MyDescriptionRestaurant(
                              nameIcon: PathImages.star,
                              text: ratingRestaurant,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            MyDescriptionRestaurant(
                              nameIcon: PathImages.delivery,
                              text: deliveryRestaurant,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            MyDescriptionRestaurant(
                              nameIcon: PathImages.clock,
                              text: clockRestaurant,
                            ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ),
    );
  }
}

class MyDescriptionRestaurant extends StatelessWidget {
  final String nameIcon;
  final String text;
  const MyDescriptionRestaurant({super.key, required this.nameIcon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(nameIcon),
        SizedBox(
          width: 6,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}