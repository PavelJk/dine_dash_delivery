import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class VideoRecipesScreen extends StatefulWidget {
  const VideoRecipesScreen({super.key});

  @override
  State<VideoRecipesScreen> createState() => _VideoRecipesScreen();
}

class _VideoRecipesScreen extends State<VideoRecipesScreen> {
  final ScrollController _scrollController = ScrollController();

  final List<Recipe> recipes = [
    Recipe('Завтраки', 'Сырники с малиновым вареньем', '45 мин', 'https://avatars.mds.yandex.net/i?id=e41ffce1744e18f1ee989a3b24d192e507bb03d5-12422251-images-thumbs&n=13'),
    Recipe('Завтраки', 'Панкейки на кефире пышные', '30 мин', 'https://avatars.mds.yandex.net/i?id=9446be04dd0028e3d0029d6e5a88aff46369f487-5486461-images-thumbs&n=13'),
    Recipe('Завтраки', 'Фруктовый смузи в блендере на кефире', '10 мин', 'https://avatars.mds.yandex.net/i?id=5480e74e9362e6c2abab5081e7c1cf22c2b8107d-5231853-images-thumbs&n=13'),
    Recipe('Обеды', 'Суп том ям', '50 мин', 'https://avatars.mds.yandex.net/i?id=af37a89da226029097ca62f99f296b1828fa267d-3183039-images-thumbs&n=13'),
    Recipe('Обеды', 'Паста карбонара', '25 мин', 'https://avatars.mds.yandex.net/i?id=04f29bbab5b3e24d252cb3808bafa21c53acdfce-12851522-images-thumbs&n=13'),
    Recipe('Ужины', 'Курица терияки', '40 мин', 'https://avatars.mds.yandex.net/i?id=28d8d951f951fe78cb479657ecd7f63323d02671-3607511-images-thumbs&n=13'),
    Recipe('Ужины', 'Плов по-узбекски', '45 мин', 'https://avatars.mds.yandex.net/i?id=837b2daae5d1182b75907754c24c55890032d139-4569449-images-thumbs&n=13'),
    Recipe('Ужины', 'Картошка по-французски', '55 мин', 'https://avatars.mds.yandex.net/i?id=d55e956f12803e09f71aa5e8ccd7ceafadd9332f-5578507-images-thumbs&n=13'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        scrolledUnderElevation: 0,
        toolbarHeight: 75,
        actionsPadding: EdgeInsets.only(right: 24),
        title: Text(
          'Видео рецепты',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 18
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: GestureDetector(
            onTap: (){
              context.pop('value');
            },
            child: CircleAvatar(
              backgroundColor: Color(0xffECF0F4),
              child: Padding(
                padding: const EdgeInsets.only(right: 1),
                child: SvgPicture.asset(
                  PathImages.back,
                  width: 8,
                  colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Список рецептов
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                
                if (index == 0 || recipes[index-1].category != recipe.category) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                        child: Text(
                          recipe.category,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      _buildRecipeItem(recipe),
                    ],
                  );
                }
                
                return _buildRecipeItem(recipe);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeItem(Recipe recipe) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 24, bottom: 15),
      child: Stack(
        children: 
        [ 
          Container(
            width: double.infinity,
            height: 129,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                  recipe.image,
                ),
                fit: BoxFit.fill,
              )
            ),
          ),
          Container(
            height: 129,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.7),
                  Colors.transparent,
                ],
                stops: [
                  0.0,
                  0.5
                ]
              )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 225,
                    child: Text(
                      recipe.name,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.white,fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 22,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        recipe.duration,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]
      ),
    );
  }
}

class Recipe {
  final String category;
  final String name;
  final String duration;
  final String image;

  Recipe(this.category, this.name, this.duration, this.image);
}
