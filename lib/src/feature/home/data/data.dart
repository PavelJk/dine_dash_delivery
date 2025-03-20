import 'dart:convert';

import 'package:dine_dash_delivery/src/feature/home/model/info_restaurant.dart';
import 'package:flutter/material.dart';

Future<List<Restaurant>> getRestaurant(BuildContext context) async{

  final assetBundle = DefaultAssetBundle.of(context);
  final data = await assetBundle.loadString('assets/temporary_data/restaurant_data.json');
  final body = json.decode(data);

  return body.map<Restaurant>(Restaurant.fromJson).toList();
}