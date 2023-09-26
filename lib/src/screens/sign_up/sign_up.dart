import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_app/src/repository/auth_repository.dart';

class SignUpScree extends StatefulWidget {
  const SignUpScree({super.key});

  @override
  State<SignUpScree> createState() => _SignUpScreeState();
}

class _SignUpScreeState extends State<SignUpScree> {
  AuthRepositoryImpl repositoryImpl =
      AuthRepositoryImpl(auth: FirebaseAuth.instance);
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
            TextButton(onPressed: () {}, child: Text("Go")),
            IconButton(onPressed: () {
              repositoryImpl.googleAuth();
            }, icon: const Icon(Icons.network_wifi))
          ],
        ),
      ),
    );
  }
}
