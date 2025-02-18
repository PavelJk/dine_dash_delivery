import 'dart:async';
import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/auth/validators/validators.dart';
import 'package:dine_dash_delivery/src/feature/widgets/appbar_widget.dart';
import 'package:dine_dash_delivery/src/feature/widgets/button_widget.dart';
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

  int _currentTimerValue = 60;
  bool _isResendCode = false;
  late Timer _timer;

  void resend(){
    setState(() {
      _isResendCode = true;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (_currentTimerValue == 0) {
            _currentTimerValue = 60;
            _isResendCode = false;
            timer.cancel();
          }else{
            _currentTimerValue--;
          }
        });
     }
     );
  }

  @override
  void initState() {
    super.initState();
    resend();
  }

  @override
  void dispose() {
    if(_timer.isActive){
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppbarWidget(
        onTap: () {
          context.goNamed(AppRoute.registrPhone.name);
        },
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
                SizedBox(height: 6,),
                Text(
                  textAlign: TextAlign.center,
                  "Мы оправили код на ваш номер\n${widget.phoneNumber}",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 27,),
                Expanded(
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25)
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 130),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "КОД",
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                _isResendCode ?
                                Text(
                                  "Получить повторно: $_currentTimerValue сек.",
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 14,
                                  ),
                                ):
                                SizedBox(
                                  height: 21,
                                  child: TextButton(
                                    onPressed: (){
                                      setState(() {
                                        if (_isResendCode) return;
                                        resend();
                                      });
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
                            SizedBox(height: 8,),
                            Form(
                              key: _formKey,
                              child: Pinput(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                defaultPinTheme: PinTheme(
                                  width: 70,
                                  height: 70,
                                  textStyle: Theme.of(context).textTheme.bodyMedium,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context).colorScheme.surface,
                                  )
                                ),
                                validator: (pin) => Validator.oTPCode(pin),
                              ),
                            ),
                            Spacer(),
                            CustomButtonWidget(
                              onPressed: (){
                                if (_formKey.currentState!.validate()) {
                                  context.goNamed(AppRoute.registrInfoAboutMe.name);
                                }
                              },
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