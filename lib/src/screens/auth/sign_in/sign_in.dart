import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jewellery_app/src/common/constants/app_router.dart';
import '../../../common/constants/strings.dart';
import '../../../common/constants/text_style.dart';
import '../sign_up/view/google_button.dart';
import '../sign_up/view/text_field_password.dart';
import '../sign_up/view/text_field_widget.dart';
import 'view/sign_in_button.dart';
import 'view/text_widget_sign_in.dart';

part './mixin/sign_in_mixin.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with SignInMixin {
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
                    flex: 3,
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
                              child:  Text(
                                Strings.skip.text,
                                style: Styles.w400,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),

                        /// Text
                         Text(
                          Strings.login.text,
                          style: Styles.w700_30,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Spacer(flex: 5),

                          /// User Email
                          TextFieldWidgets(
                            controller: controllerEmail,
                            validator: validateEmail,
                            textInputAction: TextInputAction.next,
                            hintText: Strings.email.text,
                          ),
                          const Spacer(),

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
                          const Spacer(flex: 5),

                          /// Button Sign In
                          SignInButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print("Started1");
                              }
                            },
                          ),
                          /// Text Sign In
                          TextWidgetSignIn(
                            onTap: () {
                              context.pushReplacementNamed(Routes.signUp);
                            },
                          ),
                          const Spacer(flex: 3),

                          /// Google Button
                          GoogleButton(
                            onTap: () {},
                          ),
                          const Spacer(flex: 5),
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
