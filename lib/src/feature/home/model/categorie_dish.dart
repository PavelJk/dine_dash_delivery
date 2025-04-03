class CategorieDish{
  
  final String iconDish;
  final String nameDish;

  const CategorieDish({
    required this.iconDish, 
    required this.nameDish, 
   });

  static CategorieDish fromJson(json) => CategorieDish(
    iconDish: json['icon'], 
    nameDish: json['name'], 
  );
}