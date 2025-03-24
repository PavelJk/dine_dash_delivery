import 'package:dine_dash_delivery/src/feature/auth/screens/info_about_me.dart';
import 'package:dine_dash_delivery/src/feature/auth/screens/otp_code.dart';
import 'package:dine_dash_delivery/src/feature/home/screens/main_home.dart';
import 'package:dine_dash_delivery/src/feature/location/screens/location_access.dart';
import 'package:dine_dash_delivery/src/feature/location/screens/map.dart';
import 'package:go_router/go_router.dart';

enum AppRoute{
  registrPhone,
  otpCode,
  registrInfoAboutMe,
  locationAccess,
  map,
  mainHome,
}

final GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(
      name: AppRoute.registrPhone.name,
      path: '/',
      builder: (context, state) => MapScreen(),
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
          builder: (context, state) => LocationAccess(),
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
        )
      ]
    )
  ]
);