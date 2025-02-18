import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/auth/validators/validators.dart';
import 'package:dine_dash_delivery/src/feature/auth/widgets/text_field_widget.dart';
import 'package:dine_dash_delivery/src/feature/widgets/appbar_widget.dart';
import 'package:dine_dash_delivery/src/feature/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datepicker_textfield/flutter_datepicker_textfield.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';


class RegistrInfoAboutMe extends StatefulWidget {


  const RegistrInfoAboutMe({super.key});

  @override
  State<RegistrInfoAboutMe> createState() => _RegistrInfoAboutMeState();
}

class _RegistrInfoAboutMeState extends State<RegistrInfoAboutMe> {
  //final TextEditingController _controllerPhoneNumber = TextEditingController();
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2021, 7, 25),
      firstDate: DateTime(2021),
      lastDate: DateTime(2022),
    );

    setState(() {
      selectedDate = pickedDate;
    });
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
                  child: Container(
                      height: MediaQuery.of(context).size.height,
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
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SizedBox(height: 6,),
                              CustomTextFieldWidget(
                                //controller: _controllerPhoneNumber,
                                validator: (name) => Validator.nameAndSurname(name),
                              ),
                              SizedBox(height: 23,),
                              Text(
                                "ФАМИЛИЯ",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SizedBox(height: 6,),
                              CustomTextFieldWidget(
                                //controller: _controllerPhoneNumber,
                                validator: (surname) => Validator.nameAndSurname(surname),
                              ),
                              SizedBox(height: 23,),
                              Text(
                                "ПОЧТА",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SizedBox(height: 6,),
                              CustomTextFieldWidget(
                                //controller: _controllerPhoneNumber,
                                validator: (email) => Validator.email(email),
                              ),
                              SizedBox(height: 23,),
                              Text(
                                "ДАТА РОЖДЕНИЯ",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SizedBox(height: 6,),
                              DatepickerTextfield(
                                readOnly: false,
                                textFieldDecoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide.none
                                  ),
                                  filled: true,
                                  fillColor: Theme.of(context).colorScheme.surface,
                                ),
                                validator: (data) => Validator.nameAndSurname(data),
                              ),
                              Spacer(),
                              CustomButtonWidget(
                                onPressed: (){
                                  if(_formKey.currentState!.validate()){
                                    //context.goNamed(AppRoute.otpCode.name,);
                                  }
                                },
                              ),
                            ],
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
 