import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_app/src/repository/auth_repository/sign_up/sign_up_repository.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:jewellery_app/src/repository/user_repository/user_repository.dart';

class SignUpScree extends StatefulWidget {
  const SignUpScree({super.key});

  @override
  State<SignUpScree> createState() => _SignUpScreeState();
}

class _SignUpScreeState extends State<SignUpScree> {
  SignUpRepository repositoryImpl = SignUpRepository();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(hintText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: "Password"),
            ),
            TextButton(
              onPressed: () async {
                await repositoryImpl.signUpWithEmail(
                  email: emailController.text,
                  password: passwordController.text,
                  phone: '+998905668118',
                  username: 'abduraimov',
                );
              },
              child: const Text("Go"),
            ),
            IconButton(
              onPressed: () async{
                // UserRepositoryImpl().getUser("tLuMFbvsWzOyaU1syaaHXG86r1D3");
                await repositoryImpl.googleAuth();
              },
              icon: const Icon(Icons.network_wifi),
            ),
          ],
        ),
      ),
    );
  }
}
