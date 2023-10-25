import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_app/src/common/constants/text_style.dart';

import '../main_screen/main_screen.dart';

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
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// Back Button
                            GestureDetector(
                              onTap: () {},
                              child: const SizedBox(
                                width: 46,
                                height: 46,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Color(0xFF333B48),
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),

                            /// Skip Button
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MainScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Skip",
                                style: Styles.w400,
                              ),
                            ),
                          ],
                        ),

                        /// Text
                        const Text(
                          'Create\nAccount',
                          style: Styles.w700_30,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// User Name
                          TextFormField(
                            controller: controllerName,
                            validator: validateName,
                            cursorColor: Colors.white,
                            textInputAction: TextInputAction.next,
                            style: Styles.textStyle,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFF313131),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                              hintText: "Name",
                              hintStyle: Styles.textStyle,
                            ),
                            obscureText: false,
                          ),
                          const Spacer(flex: 2),

                          /// User Email
                          TextFormField(
                            controller: controllerEmail,
                            validator: validateEmail,
                            cursorColor: Colors.white,
                            textInputAction: TextInputAction.next,
                            style: Styles.textStyle,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFF313131),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                              hintText: "you@exaple.com",
                              hintStyle: Styles.textStyle,
                            ),
                            obscureText: false,
                          ),
                          const Spacer(flex: 2),

                          /// User Password
                          TextFormField(
                            controller: controllerPassword,
                            obscureText: password,
                            validator: validatePassword,
                            cursorColor: Colors.white,
                            textInputAction: TextInputAction.next,
                            style: Styles.textStyle,
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  password = !password;
                                  setState(() {});
                                },
                                child: Icon(
                                  password
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                              filled: true,
                              fillColor: const Color(0xFF313131),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                              hintText: "Password",
                              hintStyle: Styles.textStyle,
                            ),
                          ),
                          const Spacer(flex: 2),

                          /// User Confirm Password
                          TextFormField(
                            controller: controllerCPassword,
                            obscureText: passwordSee,
                            validator: validateCPassword,
                            cursorColor: Colors.white,
                            textInputAction: TextInputAction.next,
                            style: Styles.textStyle,
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  passwordSee = !passwordSee;
                                  setState(() {});
                                },
                                child: Icon(
                                  passwordSee
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                              filled: true,
                              fillColor: const Color(0xFF313131),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                              hintText: "Confirm Password",
                              hintStyle: Styles.textStyle,
                            ),
                          ),
                          const Spacer(flex: 2),

                          /// User Phone
                          Form(
                            key: _formPhone,
                            child: TextFormField(
                              controller: controllerPhone,
                              validator: validatePhone,
                              cursorColor: Colors.white,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.phone,
                              style: Styles.textStyle,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFF313131),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 15,
                                ),
                                hintText: "Phone",
                                hintStyle: Styles.textStyle,
                              ),
                              obscureText: false,
                            ),
                          ),
                          const Spacer(flex: 5),

                          /// Get Start Button
                          CupertinoButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print("Started");
                              }
                            },
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              height: MediaQuery.sizeOf(context).height * 0.07,
                              child: const DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Color(0xFF313131),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Get started',
                                    textAlign: TextAlign.center,
                                    style: Styles.w600_20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Center(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Already have an account?',
                                    style: TextStyle(
                                      color: Colors.white
                                          .withOpacity(0.699999988079071),
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: 'Sign in',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(flex: 6),

                          /// Google Button
                          GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Container(
                                width: 47,
                                height: 47,
                                decoration: const ShapeDecoration(
                                  shape: OvalBorder(
                                    side: BorderSide(
                                        width: 0.80, color: Colors.white),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Image(
                                    image: AssetImage(
                                        "assets/icons/ic_google.png"),
                                  ),
                                ),
                              ),
                            ),
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
