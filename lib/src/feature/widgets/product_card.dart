import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyCustonCardProduct extends StatelessWidget {
  final String name;
  final String place;
  final String price;
  final String image;

  const MyCustonCardProduct({super.key, required this.name, required this.place, required this.price, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 45),
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(-0.30),
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(20),
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
                  padding: const EdgeInsets.only(top: 53, right: 11, left: 11),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        place,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 13,
                          color: Color(0xff646982),
                        )
                      ),
                      const SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('$price р'),
                          GestureDetector(
                            onTap: () {
                              context.goNamed(
                                AppRoute.prodCard.name,
                                pathParameters:{
                                  "nameRest" : place,
                                  "nameProduct" : name,
                                  "price" : price,
                                  "image" : image,
                                }, 
                              );
                            },
                            child: CircleAvatar(
                              radius: 17,
                              backgroundColor: Theme.of(context).colorScheme.tertiary,
                              child: const Icon(
                                Icons.add,
                                size: 22,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 12,
          left: 12.5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              image,
              width: 122,
              height: 84,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}