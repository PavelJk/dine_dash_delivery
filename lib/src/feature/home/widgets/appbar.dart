import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/home/widgets/nav_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../common/resources/path_images.dart';

class MyFirstHomeSliverAppbar extends StatelessWidget {
  final void Function()? onTap;
  final DropdownButton<String> dropdownButton;
  const MyFirstHomeSliverAppbar(
      {super.key, this.onTap, required this.dropdownButton});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      pinned: true,
      toolbarHeight: 17,
      flexibleSpace: FlexibleSpaceBar(
        background: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onTap,
              child: CircleAvatar(
                radius: 26,
                backgroundColor: Theme.of(context).colorScheme.onTertiary,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: SvgPicture.asset(
                    PathImages.menu,
                    width: 22,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 7, top: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ДОСТАВИТЬ В',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontSize: 12,
                        ),
                  ),
                  dropdownButton,
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                context.goNamed(AppRoute.basket.name,);
              },
              child: Stack(
                children: [
                  SizedBox(
                    width: 50,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: SvgPicture.asset(
                        PathImages.corzina,
                        width: 24,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Theme.of(context).colorScheme.tertiary,
                      child: Text(
                        '2',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MySecondNavHomeSliverAppBar extends StatelessWidget {
  const MySecondNavHomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: 60,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyNavHomeButton(
                onTap: () {
                  context.goNamed(AppRoute.search.name);
                },
                text: 'Поиск',
                iconName: PathImages.search,
              ),
              SizedBox(
                width: 18,
              ),
              MyNavHomeButton(
                onTap: () {
                  context.goNamed(AppRoute.video.name,);
                },
                text: 'Рецепты',
                iconName: PathImages.video,
              )
            ],
          ),
        ),
      ),
    );
  }
}
