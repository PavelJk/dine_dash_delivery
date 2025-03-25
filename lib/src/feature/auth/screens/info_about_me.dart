import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/auth/validators/validators.dart';
import 'package:dine_dash_delivery/src/feature/auth/widgets/text_field_widget.dart';
import 'package:dine_dash_delivery/src/feature/auth/widgets/appbar_widget.dart';
import 'package:dine_dash_delivery/src/feature/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';


class RegistrInfoAboutMe extends StatefulWidget {


  const RegistrInfoAboutMe({super.key});

  @override
  State<RegistrInfoAboutMe> createState() => _RegistrInfoAboutMeState();
}

class _RegistrInfoAboutMeState extends State<RegistrInfoAboutMe> {

  final TextEditingController _datePickerController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2030),
    );

   if (pickedDate == null) return;
   _datePickerController.text = DateFormat('dd.MM.yyyy').format(pickedDate);
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
                  "О себе",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 6,),
                Text(
                  textAlign: TextAlign.center,
                  "Пожалуйста расскажите о себе",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 27,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.732,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25)
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ИМЯ",
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                                SizedBox(height: 2,),
                                CustomTextFieldWidget(
                                  //controller: _controllerPhoneNumber,
                                  validator: (name) => Validator.nameAndSurname(name),
                                ),
                                SizedBox(height: 13,),
                                Text(
                                  "ФАМИЛИЯ",
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                                SizedBox(height: 2,),
                                CustomTextFieldWidget(
                                  //controller: _controllerPhoneNumber,
                                  validator: (surname) => Validator.nameAndSurname(surname),
                                ),
                                SizedBox(height: 13,),
                                Text(
                                  "ПОЧТА",
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                                SizedBox(height: 2,),
                                CustomTextFieldWidget(
                                  //controller: _controllerPhoneNumber,
                                  validator: (email) => Validator.email(email),
                                ),
                                SizedBox(height: 13,),
                                Text(
                                  "ДАТА РОЖДЕНИЯ",
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                                SizedBox(height: 2,),
                                CustomTextFieldWidget(
                                  controller: _datePickerController,
                                  readOnly : true,
                                  validator: (date) => Validator.nameAndSurname(date),
                                  suffixIcon: IconButton(
                                  onPressed: (){
                                    _selectDate();
                                  },
                                   icon: SvgPicture.asset(
                                    PathImages.happybirsday,
                                    width: 25,
                                  ),
                                  )
                                ),
                                Spacer(),
                                CustomButtonWidget(
                                  onPressed: (){
                                    if(_formKey.currentState!.validate()){
                                      context.goNamed(AppRoute.locationAccess.name,);
                                    }
                                  },
                                  text: 'ВОЙТИ',
                                ),
                              ],
                            ),
                          ),
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
 