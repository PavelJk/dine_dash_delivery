import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/feature/home/widgets/appbar_home_widget.dart';
import 'package:dine_dash_delivery/src/feature/home/widgets/nav_button_widget.dart';
import 'package:dine_dash_delivery/src/feature/home/widgets/prod_and_rest_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<String> address = ['ул. Пушкина, 15, кв. 50', 'ул. Дружбы, 89, кв. 50'];
  String? selectItem = 'ул. Пушкина, 15, кв. 50';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarHomeWidget(
        dropdownButton: DropdownButton<String>(
          iconEnabledColor: Theme.of(context).colorScheme.secondary,
          underline: const SizedBox(),
          iconSize: 26,
          isDense: true,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          dropdownColor: Theme.of(context).colorScheme.onTertiary,
          value: selectItem,
          items: address
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        item,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                    ),
                  ))
              .toList(),
          onChanged: (item) => setState(() => selectItem = item),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Добрый день, ',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
                Text(
                  'Павел!',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavButtonWidget(
                  onTap: () {
                    
                  },
                  text: 'Поиск',
                  iconName: PathImages.search,
                ),
                SizedBox(width: 25,),
                NavButtonWidget(
                  onTap: () {
                    
                  },
                  text: 'Рецепты',
                  iconName: PathImages.video,
                )
              ],
            ),
            SizedBox(height: 35,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProdAndRestButtonWidget(
                  text: 'Продукты', 
                  nameImage: PathImages.product,
                  onTap: () {
                    
                  }
                ),
                ProdAndRestButtonWidget(
                  text: 'Рестораны', 
                  nameImage: PathImages.restoran,
                  onTap: () {
                    
                  },
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Рестораны',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: TextButton.icon(
                    onPressed: () {
                      
                    },
                    label: Text(
                      'Смотреть все',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 2.5),
                      child: SvgPicture.asset(
                        PathImages.forward,
                      ),
                    ),
                    iconAlignment: IconAlignment.end,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      splashFactory: NoSplash.splashFactory,
                      enableFeedback: false,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Container(
                      width: double.infinity,
                      height: 229,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.amber,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

