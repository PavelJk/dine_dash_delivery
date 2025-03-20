class Restaurant{
  
  final String nameRestaurant;
  final String menuRestaurant;
  final String ratingRestaurant;
  final String deliveryRestaurant;
  final String clockRestaurant;
  final String imageRestaurant;

  const Restaurant({
    required this.nameRestaurant, 
    required this.menuRestaurant, 
    required this.ratingRestaurant, 
    required this.deliveryRestaurant, 
    required this.clockRestaurant, 
    required this.imageRestaurant, 
   });

   static Restaurant fromJson(json) => Restaurant(
    nameRestaurant: json['name'], 
    menuRestaurant: json['menu'], 
    ratingRestaurant: json['rating'], 
    deliveryRestaurant: json['delivery'], 
    clockRestaurant: json['clock'], 
    imageRestaurant: json['image'],
   );
}