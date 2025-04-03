import 'dart:convert';
import 'package:dine_dash_delivery/src/feature/home/model/categorie_dish.dart';
import 'package:dine_dash_delivery/src/feature/home/model/info_restaurant.dart';
import 'package:flutter/material.dart';

Future<List<Restaurant>> getRestaurant(BuildContext context) async{ //Получение базы данных ре в виде json

  final assetBundle = DefaultAssetBundle.of(context);
  final data = await assetBundle.loadString('assets/temporary_data/restaurant_data.json');
  final body = json.decode(data);

  return body.map<Restaurant>(Restaurant.fromJson).toList();
}

Future<List<CategorieDish>> getCategorieDish(BuildContext context) async{ //Получение базы данных в виде json

  final assetBundle = DefaultAssetBundle.of(context);
  final data = await assetBundle.loadString('assets/temporary_data/categorie_dish_data.json');
  final body = json.decode(data);

  return body.map<CategorieDish>(CategorieDish.fromJson).toList();
}