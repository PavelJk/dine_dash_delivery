import 'dart:async';
import 'dart:math';
import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/auth/validators/validators.dart';
import 'package:dine_dash_delivery/src/feature/auth/widgets/appbar.dart';
import 'package:dine_dash_delivery/src/feature/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class OTPCode extends StatefulWidget {
  final String phoneNumber;

  const OTPCode({super.key, required this.phoneNumber});

  @override
  State<OTPCode> createState() => _OTPCodeState();
}

class _OTPCodeState extends State<OTPCode> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> _predefinedCodes = ['1234', '5678', '9012'];
  String? _currentCode;
  bool _showCode = false; // Флаг для отображения кода на экране

  int _currentTimerValue = 60;
  bool _isResendCode = false;
  late Timer _timer;
  late Timer _initialSmsTimer;

  void resend(){
    final random = Random();
    _currentCode = _predefinedCodes[random.nextInt(_predefinedCodes.length)];
    
    setState(() {
      _isResendCode = true;
      _currentTimerValue = 60;
      _showCode = true; // Показываем код при отправке
    });
    
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_currentTimerValue == 0) {
          _isResendCode = false;
          _showCode = false; // Скрываем код когда таймер истёк
          timer.cancel();
        } else {
          _currentTimerValue--;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initialSmsTimer = Timer(const Duration(seconds: 3), resend);
  }

  @override
  void dispose() {
    _timer.cancel();
    _initialSmsTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: MyAuthAndLocationAppbar(
        onTap: () {
          context.goNamed(AppRoute.registrPhone.name);
        },
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        iconColor: Theme.of(context).colorScheme.primary,
      ),
      body: Stack(
        children: [
          Positioned(
            child: SvgPicture.asset(
              PathImages.ellipseAuth,
              width: 155,
            ),
          ),
          Positioned(
            right: 0,
            child: SvgPicture.asset(
              PathImages.vectorAuth,
              width: 98,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 118),
            child: Column(
              children: [
                Text(
                  "Введите код",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 6),
                Column(
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      "Мы отправили код на ваш номер\n${widget.phoneNumber}",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    if (_showCode && _currentCode != null) // Показываем код если флаг активен
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Ваш код: $_currentCode',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 27),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(25)
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "КОД",
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                              _isResendCode
                                ? Text(
                                    "Получить повторно: $_currentTimerValue сек.",
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontSize: 14,
                                      color: Theme.of(context).colorScheme.onPrimary,
                                    ),
                                  )
                                : SizedBox(
                                    height: 21,
                                    child: TextButton(
                                      onPressed: () {
                                        if (!_isResendCode) {
                                          resend();
                                        }
                                      },
                                      style: TextButton.styleFrom(
                                        splashFactory: NoSplash.splashFactory,
                                        padding: EdgeInsets.zero,
                                      ),
                                      child: Text(
                                        'Отправить повторно',
                                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          fontSize: 14,
                                          decoration: TextDecoration.underline,
                                        ),
                                      )
                                    ),
                                  ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Form(
                            key: _formKey,
                            child: Pinput(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              defaultPinTheme: PinTheme(
                                width: 65,
                                height: 65,
                                textStyle: Theme.of(context).textTheme.bodyMedium,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).colorScheme.surface,
                                )
                              ),
                              validator: (pin) {
                                if (pin == null || pin.isEmpty) {
                                  return 'Введите код';
                                }
                                if (pin != _currentCode) {
                                  return 'Неверный код';
                                }
                                return null;
                              },
                            ),
                          ),
                          const Spacer(),
                          MyCustomMainButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.goNamed(AppRoute.registrInfoAboutMe.name);
                              }
                            },
                            text: 'ПРОДОЛЖИТЬ',
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}