import 'package:dine_dash_delivery/src/feature/auth/screens/info_about_me.dart';
import 'package:dine_dash_delivery/src/feature/auth/screens/otp_code.dart';
import 'package:dine_dash_delivery/src/feature/home/screens/main_home.dart';
import 'package:dine_dash_delivery/src/feature/home/screens/restaurant_home.dart';
import 'package:dine_dash_delivery/src/feature/location/screens/location_access.dart';
import 'package:dine_dash_delivery/src/feature/location/screens/map.dart';
import 'package:dine_dash_delivery/src/feature/setting/screens/info_address.dart';
import 'package:dine_dash_delivery/src/feature/setting/screens/profile.dart';
import 'package:dine_dash_delivery/src/feature/setting/screens/setting_app.dart';
import 'package:dine_dash_delivery/src/feature/transactions/screens/add_card.dart';
import 'package:go_router/go_router.dart';

enum AppRoute{
  registrPhone,
  otpCode,
  registrInfoAboutMe,
  locationAccess,
  map,
  mainHome,
  restaurantHome,
  profile,
  setting,
  infoAddress,
}

final GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(
      name: AppRoute.registrPhone.name,
      path: '/',
      builder: (context, state) => MainHome(),
      routes: [
        GoRoute(
          name: AppRoute.otpCode.name,
          path: 'otpCode/:phoneNumber',
          builder: (context, state) => OTPCode(
            phoneNumber: state.pathParameters["phoneNumber"]!,
          ),
        ),
        GoRoute(
          name: AppRoute.registrInfoAboutMe.name,
          path: 'registrInfoAboutMe',
          builder: (context, state) => RegistrInfoAboutMe(),
        ),
        GoRoute(
          name: AppRoute.locationAccess.name,
          path: 'locationAccess',
          builder: (context, state) => LocationAccessScreen(),
        ),
        GoRoute(
          name: AppRoute.map.name,
          path: 'map',
          builder: (context, state) => MapScreen(),
        ),
        GoRoute(
          name: AppRoute.mainHome.name,
          path: 'mainHome',
          builder: (context, state) => MainHome(),
        ),
        GoRoute(
          name: AppRoute.restaurantHome.name,
          path: 'restaurantHome',
          builder: (context, state) => RestaurantHomeScreen(),
        ),
        GoRoute(
          name: AppRoute.profile.name,
          path: 'profile',
          builder: (context, state) => ProfileScreen(),
        ),
        GoRoute(
          name: AppRoute.setting.name,
          path: 'setting',
          builder: (context, state) => SettingsScreen(),
        ),
        GoRoute(
          name: AppRoute.infoAddress.name,
          path: 'infoAddress',
          builder: (context, state) => AddressScreen(),
        ),
      ]
    )
  ]
);