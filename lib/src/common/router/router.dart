import 'package:dine_dash_delivery/src/feature/auth/screens/otp_code.dart';
import 'package:dine_dash_delivery/src/feature/auth/screens/registr_number.dart';
import 'package:go_router/go_router.dart';

enum AppRoute{
 otpCode, 
}

final GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => RegistrNumberScreen(),
      routes: [
        GoRoute(
          path: 'otpCode',
          name: AppRoute.otpCode.name,
          builder: (context, state) => OTPCode(),
        )
      ]
    )
  ]
);