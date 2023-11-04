import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jewellery_app/app_options.dart';
import 'package:jewellery_app/src/common/constants/app_router.dart';
import 'package:jewellery_app/src/screens/choose_lang/view/custom_lang_button.dart';

class ChooseLang extends StatefulWidget {
  const ChooseLang({super.key});

  @override
  State<ChooseLang> createState() => _ChooseLangState();
}

class _ChooseLangState extends State<ChooseLang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            left: 16,
            top: 108,
            child: Image.asset(
              "assets/icons/ic_app_icons.jpg",
              width: 148,
              height: 132,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Выберите язык:',
                  ),
                  const SizedBox(height: 12),
                  CustomLangButton(
                    image: "uz",
                    label: 'O\'zbekcha',
                    onPressed: () => _chooseLang("uz"),
                  ),
                  const SizedBox(height: 16),
                  CustomLangButton(
                    image: "ru",
                    label: 'Русский',
                    onPressed: () => _chooseLang("ru"),
                  ),
                  const SizedBox(height: 16),
                  CustomLangButton(
                    image: "us",
                    label: 'English',
                    onPressed: () => _chooseLang("en"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _chooseLang(String locale) {
    AppOptions.update(
      context,
      AppOptions.of(context).copyWith(locale: Locale(locale)),
    );
    context.pushReplacementNamed(Routes.main);
  }
}
