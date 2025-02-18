import 'package:dine_dash_delivery/src/feature/auth/screens/info_about_me.dart';
import 'package:dine_dash_delivery/src/feature/auth/screens/otp_code.dart';
import 'package:dine_dash_delivery/src/feature/auth/screens/registr_number.dart';
import 'package:go_router/go_router.dart';

enum AppRoute{
  registrPhone,
  otpCode,
  registrInfoAboutMe
}

final GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(
      name: AppRoute.registrPhone.name,
      path: '/',
      builder: (context, state) => RegistrNumberScreen(),
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
        )
      ]
    )
  ]
);