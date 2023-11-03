import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jewellery_app/src/common/constants/app_router.dart';
import 'package:jewellery_app/src/common/constants/strings.dart';
import '../bloc/auth_bloc.dart';
import 'view/back_button_and_text_button.dart';
import 'view/get_started_button.dart';
import 'view/google_button.dart';
import 'view/text_field_password.dart';
import 'view/text_field_widget.dart';
import 'view/text_widget_sign_up.dart';

part 'mixin/signi_up_mixin.dart';

class SignUpScree extends StatefulWidget {
  const SignUpScree({super.key});

  @override
  State<SignUpScree> createState() => _SignUpScreeState();
}

class _SignUpScreeState extends State<SignUpScree> with SignUpMixin {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {},
      child: Scaffold(
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
                    /// Back Button  and Text
                    BackButtonAndText(
                      textButton: () {
                        context.pushReplacementNamed(Routes.main);
                      },
                      backButton: () {
                        context.pop();
                      },
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
                              hintText: Strings.name.text,
                            ),
                            const Spacer(flex: 2),

                            /// User Email
                            TextFieldWidgets(
                              controller: controllerEmail,
                              validator: validateEmail,
                              textInputAction: TextInputAction.next,
                              hintText: Strings.email.text,
                            ),
                            const Spacer(flex: 2),

                            /// User Password
                            TextFieldPassword(
                              controller: controllerPassword,
                              validator: validatePassword,
                              textInputAction: TextInputAction.next,
                              hintText: Strings.password.text,
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
                              hintText: Strings.confirmPassword.text,
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
                            const Spacer(flex: 5),

                            /// Get Start Button
                            GetStartedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  print("Started1");
                                }
                              },
                            ),
                            const Spacer(),

                            /// Text Sign In
                            TextWidgetSignUp(
                              onTap: () {
                                context.pushReplacementNamed(Routes.signIn);
                              },
                            ),
                            const Spacer(flex: 6),

                            /// Google Button
                            GoogleButton(
                              onTap: () {},
                            ),
                            const Spacer(flex: 2),
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
      ),
    );
  }
}
