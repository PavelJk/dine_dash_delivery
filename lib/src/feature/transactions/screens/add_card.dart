import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/transactions/widgets/text_field.dart';
import 'package:dine_dash_delivery/src/feature/transactions/widgets/transac_app_bar.dart';
import 'package:dine_dash_delivery/src/feature/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddCardScreen extends StatefulWidget {
  final String ismethod;
  final String totalAmount;

   const AddCardScreen({super.key, required this.ismethod, required this.totalAmount});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final MaskTextInputFormatter _maskFormatterNumberCard = MaskTextInputFormatter(
    mask: '#### #### #### ####', 
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy
  );
  final MaskTextInputFormatter _maskExpiryFormatter = MaskTextInputFormatter(
    mask: '##/##', 
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy
  );
  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransactionsAppBar(
        text: 'Добавление карты',
        onTap: () {
          if (widget.ismethod == 'true') {
            context.goNamed(
            AppRoute.paymentMethodScreen.name,
            pathParameters:{
              "isCard" : 'false',
              "cardNumber" : 'cardNumber',
              "totalAmount" : widget.totalAmount,
            });
          }else{
            context.goNamed(
            AppRoute.paymentMethodEmpty.name,
            pathParameters:{
              "isCard" : 'false',
              "cardNumber" : 'dfd',
            },
          );
          }
        },
      ),

      body: Padding(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyCustomTransactionTextField(
                text: 'Номер карты',
                controller: _cardNumberController,
                inputFormatters: [
                  _maskFormatterNumberCard,
                ],
                hintText: '2134   _ _ _ _   _ _ _ _',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите номер карты';
                  }
                  if (value.replaceAll(' ', '').length != 16) {
                    return 'Номер карты должен содержать 16 цифр';
                  }
                  return null;
                },
              ),

              SizedBox(height: 24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: MyCustomTransactionTextField(
                      text: 'Действует до',
                      controller: _expiryDateController,
                      inputFormatters: [
                        _maskExpiryFormatter,
                      ],
                      hintText: 'ММ/ГГ',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите срок';
                        }
                        if (value.length != 5 || int.parse(value.substring(0, 2)) > 31) {
                          return 'Неверный формат';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: MyCustomTransactionTextField(
                      controller: _cvvController,
                      text: 'CVC/CVV',
                      obscureText: true,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                      ],
                      hintText: '***',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Введите CVV';
                        }
                        if (value.length != 3) {
                          return 'CVV должен содержать 3 цифры';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Spacer(),
              MyCustomMainButton(
                onPressed: _submitForm,
                 text: 'ДОБАВИТЬ КАРТУ'
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final cardNumber = _cardNumberController.text;
      if (widget.ismethod == 'true') {
        context.goNamed(
        AppRoute.paymentMethodScreen.name,
        pathParameters:{
          "isCard" : 'true',
          "cardNumber" : cardNumber,
          "totalAmount" : widget.totalAmount,
        });
      }else{
        context.goNamed(
        AppRoute.paymentMethodEmpty.name,
        pathParameters:{
          "isCard" : 'true',
          "cardNumber" : cardNumber,
        },
      );
      }
    }
  }
}
