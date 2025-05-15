import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/setting/widgets/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24, top: 55),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(PathImages.avatarNull),
                ),
                SizedBox(width: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Павел Бартеньев",
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      "Я люблю фаст-фуд",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Color(0xffA0A5BA),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(bottom: 20, top: 25),
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSecondary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        _buildListTile(
                          context: context,
                          icon: PathImages.iconProfile,
                          title: "Информация",
                          onTap: () {
                            context.goNamed(AppRoute.profile.name,);
                          },
                        ),
                        _buildListTile(
                          context: context,
                          icon: PathImages.iconAddress,
                          title: "Адрес",
                          onTap: () {
                            context.goNamed(AppRoute.infoAddress.name,);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 21,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSecondary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        _buildListTile(
                          context: context,
                          icon: PathImages.basket,
                          title: "Корзина",
                          onTap: () {
                            context.goNamed(AppRoute.basket.name,);
                          },
                        ),
                        _buildListTile(
                          context: context,
                          icon: PathImages.favorite,
                          title: "Избранное",
                          onTap: () {
                            context.goNamed(AppRoute.favorite.name,);
                          },
                        ),
                        _buildListTile(
                          context: context,
                          icon: PathImages.myOrder,
                          title: "Мои заказы",
                          onTap: () {
                            context.goNamed(AppRoute.myOrder.name,);
                          },
                        ),
                        _buildListTile(
                          context: context,
                          icon: PathImages.myvid,
                          title: "Видео рецепты",
                          onTap: () {
                            context.goNamed(AppRoute.video.name,);
                          },
                        ),
                        _buildListTile(
                          context: context,
                          icon: PathImages.qalet,
                          title: "Способ оплаты",
                          onTap: () {
                            context.goNamed(
                              AppRoute.paymentMethodEmpty.name,
                              pathParameters:{
                                "isCard" : 'false',
                                "cardNumber" : 'tet',
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 21,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSecondary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                         _buildListTile(
                          context: context,
                          icon: PathImages.vopr,
                          title: "Частые вопросы",
                          onTap: () {
                            context.goNamed(AppRoute.questions.name,);
                          },
                        ),
                        _buildListTile(
                          context: context,
                          icon: PathImages.myReview,
                          title: "Мои отзывы",
                          onTap: () {
                            context.goNamed(AppRoute.review.name,);
                          },
                        ),
                        _buildListTile(
                          context: context,
                          icon: PathImages.setting,
                          title: "Настройки",
                          onTap: () {
                            context.goNamed(AppRoute.setting.name,);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 21,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSecondary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        _buildListTile(
                          context: context,
                          icon: PathImages.logout,
                          title: "Выйти из аккаунта",
                          onTap: () {
                            showDeleteAccountDialog(
                              context,
                              'Выйти из аккаунта?',
                              'Вы точно хотите выйти из аккаунта? После выхода понадобится повторный вход.',
                              'Выйти',
                            );
                          },
                        ),
                      ],
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

  Widget _buildListTile({
    required String icon,
    required String title,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SvgPicture.asset(
          icon,
          width: 10,
          height: 10,
          fit: BoxFit.scaleDown,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: Color(0xff747783),
        size: 20,
      ),
      title: Text(title),
      onTap: onTap,
    );
  }
}