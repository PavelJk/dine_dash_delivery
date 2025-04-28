import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Павел Бартеньев"),
            accountEmail: const Text("Я люблю фаст-фуд"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "ПБ",
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildListTile(
                  icon: Icons.info_outline,
                  title: "Информация",
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.location_on_outlined,
                  title: "Адрес",
                  onTap: () {},
                ),
                const Divider(),
                _buildListTile(
                  icon: Icons.shopping_cart_outlined,
                  title: "Корзина",
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.favorite_border,
                  title: "Избранное",
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.list_alt,
                  title: "Мои заказы",
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.ondemand_video,
                  title: "Видео рецепты",
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.credit_card,
                  title: "Способ оплаты",
                  onTap: () {},
                ),
                const Divider(),
                _buildListTile(
                  icon: Icons.help_outline,
                  title: "Частые вопросы",
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.rate_review_outlined,
                  title: "Мои отзывы",
                  onTap: () {},
                ),
                _buildListTile(
                  icon: Icons.settings_outlined,
                  title: "Настройки",
                  onTap: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Выйти из аккаунта"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}