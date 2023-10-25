import 'package:flutter/material.dart';
import 'package:jewellery_app/src/screens/sign_in/sign_in.dart';
import '../main_screen/main_screen.dart';
import 'view/back_button_and_text_button.dart';
import 'view/get_started_button.dart';
import 'view/google_button.dart';
import 'view/text_field_password.dart';
import 'view/text_field_widget.dart';
import 'view/text_widget.dart';

part './mixin/signi_up_mixin.dart';

class SignUpScree extends StatefulWidget {
  const SignUpScree({super.key});

  @override
  State<SignUpScree> createState() => _SignUpScreeState();
}

class _SignUpScreeState extends State<SignUpScree> with SignUpMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.92,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Back Button  and Text
                  BackButtonAndText(
                    textButton: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                      );
                    },
                    backButton: () {},
                  ),
                  Expanded(
                    flex: 8,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// User Name
                          TextFieldWidgets(
                            controller: controllerName,
                            validator: validateName,
                            textInputAction: TextInputAction.next,
                            hintText: 'Name',
                          ),
                          const Spacer(flex: 2),

                          /// User Email
                          TextFieldWidgets(
                            controller: controllerEmail,
                            validator: validateEmail,
                            textInputAction: TextInputAction.next,
                            hintText: 'you@exaple.com',
                          ),
                          const Spacer(flex: 2),

                          /// User Password
                          TextFieldPassword(
                            controller: controllerPassword,
                            validator: validatePassword,
                            textInputAction: TextInputAction.next,
                            hintText: 'Password',
                            obscureText: password,
                            onTap: () {
                              password = !password;
                              setState(() {});
                            },
                            widget: Icon(
                              password
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                          const Spacer(flex: 2),

                          /// User Confirm Password
                          TextFieldPassword(
                            controller: controllerCPassword,
                            validator: validateCPassword,
                            textInputAction: TextInputAction.next,
                            hintText: 'Confirm Password',
                            obscureText: passwordSee,
                            onTap: () {
                              passwordSee = !passwordSee;
                              setState(() {});
                            },
                            widget: Icon(
                              passwordSee
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                          const Spacer(flex: 2),

                          /// User Phone
                          Form(
                            key: _formPhone,
                            child: TextFieldWidgets(
                              controller: controllerPhone,
                              validator: validatePhone,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.phone,
                              hintText: 'Phone',
                            ),
                          ),
                          const Spacer(flex: 5),

                          /// Get Start Button
                          GetStartedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print("Started");
                              }
                            },
                          ),
                          const Spacer(),

                          /// Text Sign In
                          TextWidget(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInScreen(),
                                ),
                              );
                            },
                          ),
                          const Spacer(flex: 6),

                          /// Google Button
                          GoogleButton(
                            onTap: () {},
                          ),
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
