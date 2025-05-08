import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/feature/setting/widgets/setting_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final String _name = "Павел Бартеньев";
  final String _email = "pavel.2021@list.ru";
  final String _phone = "+7 777 778-80-18";
  final String _birthDate = "01.03.2003";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingsAppBar(
        text: 'Информация',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: 32),
            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSecondary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfile(
                        label: 'ФИО',
                        icon: PathImages.iconProfile,
                        context: context,
                        value: _name,
                      ),
                      SizedBox(height: 16,),
                      _buildProfile(
                        label: 'ПОЧТА',
                        icon: PathImages.email,
                        value: _email,
                        context: context,
                      ),
                      SizedBox(height: 16,),
                      _buildProfile(
                        label: 'НОМЕР ТЕЛЕФОНА',
                        icon: PathImages.phone,
                        value: _phone,
                        context: context,
                      ),
                      SizedBox(height: 16,),
                      _buildProfile(
                        label: 'ДАТА РОЖДЕНИЯ',
                        icon: PathImages.hypi,
                        value: _birthDate,
                        context: context,
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildProfile({
    required String label,
    required String value,
    required String icon,
    required BuildContext context,
  }) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
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
        SizedBox(width: 15,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Color(0xff6B6E82),
                height: 0
              ),
            ),
          ],
        )
      ],
    );
  }
}