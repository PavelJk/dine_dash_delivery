import 'dart:convert';
import 'package:dine_dash_delivery/src/feature/home/model/categorie_dish.dart';
import 'package:dine_dash_delivery/src/feature/home/model/info_restaurant.dart';
import 'package:flutter/material.dart';

Future<List<Restaurant>> getRestaurant(BuildContext context) async{ //Получение базы данных для карточки ресторана
  final assetBundle = DefaultAssetBundle.of(context);
  final data = await assetBundle.loadString('assets/temporary_data/restaurant_data.json');
  final body = json.decode(data);

  return body.map<Restaurant>(Restaurant.fromJson).toList();
}

Future<List<CategorieDish>> getCategorieDish(BuildContext context) async{ //Получение базы данных для категорий

  final assetBundle = DefaultAssetBundle.of(context);
  final data = await assetBundle.loadString('assets/temporary_data/categorie_dish_data.json');
  final body = json.decode(data);

  return body.map<CategorieDish>(CategorieDish.fromJson).toList();
}

Future<List<CategorieDish>> getProductStore(BuildContext context) async{ //Получение базы данных карточки товара магазина

  final assetBundle = DefaultAssetBundle.of(context);
  final data = await assetBundle.loadString('product_store.json');
  final body = json.decode(data);

  return body.map<CategorieDish>(CategorieDish.fromJson).toList();
}

Future<List<CategorieDish>> getProductRest(BuildContext context) async{ //Получение базы данных для карточки товара ресторана

  final assetBundle = DefaultAssetBundle.of(context);
  final data = await assetBundle.loadString('product_rest_data.json');
  final body = json.decode(data);

  return body.map<CategorieDish>(CategorieDish.fromJson).toList();
}

Future<List<CategorieDish>> getVideo(BuildContext context) async{ //Получение базы данных для видео рецептов

  final assetBundle = DefaultAssetBundle.of(context);
  final data = await assetBundle.loadString('vdeo_data.json');
  final body = json.decode(data);

  return body.map<CategorieDish>(CategorieDish.fromJson).toList();
}

