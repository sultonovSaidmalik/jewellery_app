import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../common/constants/app_router.dart';
import '../../common/constants/strings.dart';
import '../../common/constants/text_style.dart';
import 'view/registration_button.dart';
import 'view/text_field_widget_registration.dart';

part './mixin/registration_mixin.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with RegistrationMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.92,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox.shrink(),

                            /// Skip Button
                            TextButton(
                              onPressed: () {
                                context.pushReplacementNamed(Routes.main);
                              },
                              child: Text(
                                Strings.skip.text,
                                style: Styles.w400,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),

                        /// Text
                        Text(
                          Strings.registration.text,
                          style: Styles.w700_30,
                        ),
                        const Spacer(),

                        /// Text
                        Text(
                          Strings.write.text,
                          style: Styles.w400_15,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Spacer(),

                          /// User Name
                          TextFieldRegistrationWidgets(
                            controller: controllerName,
                            validator: validateName,
                            textInputAction: TextInputAction.next,
                            hintText: Strings.name.text,
                          ),
                          const Spacer(),

                          /// User Number
                          TextFieldRegistrationWidgets(
                            controller: controllerPhone,
                            validator: validatePhone,
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.phone,
                            hintText: Strings.phone.text,
                          ),
                          const Spacer(flex: 8),
                          RegistrationButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print("Started1");
                                showMyDialog();
                              }
                            },
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
