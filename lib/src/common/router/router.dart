import 'package:dine_dash_delivery/src/feature/auth/screens/otp_code.dart';
import 'package:dine_dash_delivery/src/feature/auth/screens/registr_number.dart';
import 'package:go_router/go_router.dart';

enum AppRoute{
  registrPhone,
  otpCode,
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
        )
      ]
    )
  ]
);