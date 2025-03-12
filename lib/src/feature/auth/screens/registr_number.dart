import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/auth/validators/validators.dart';
import 'package:dine_dash_delivery/src/feature/auth/widgets/text_field_widget.dart';
import 'package:dine_dash_delivery/src/feature/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegistrNumberScreen extends StatelessWidget {

  final MaskTextInputFormatter _maskFormatter = MaskTextInputFormatter(
    mask: '+7 ### ### ## ##', 
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy
  );

  //final TextEditingController _controllerPhoneNumber = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegistrNumberScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
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
                  "Телефон",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 6,),
                Text(
                  textAlign: TextAlign.center,
                  "Пожалуйста введите свой номер\nтелефон",
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
                            Text(
                              "НОМЕР ТЕЛФОНА",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(height: 6,),
                            Form(
                              key: _formKey,
                              child: CustomTextFieldWidget(
                                inputFormatters: [_maskFormatter],
                                //controller: _controllerPhoneNumber,
                                validator: (mobile) => Validator.phoneNumber(mobile),
                              ),
                            ),
                            Spacer(),
                            CustomButtonWidget(
                              onPressed: (){
                                if(_formKey.currentState!.validate()){
                                  context.goNamed(
                                    AppRoute.otpCode.name,
                                    pathParameters:{
                                      "phoneNumber" : _maskFormatter.getMaskedText()
                                    },
                                  );
                                }
                              },
                              text: 'ПРОДОЛЖИТЬ',
                            ),
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
 