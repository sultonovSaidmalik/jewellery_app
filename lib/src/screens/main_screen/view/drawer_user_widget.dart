import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_app/app_options.dart';
import 'package:jewellery_app/src/common/constants/strings.dart';
import 'package:jewellery_app/src/common/ext/context_ext.dart';
import 'package:jewellery_app/src/common/service/local_dara_service.dart';

import '../../../common/constants/text_style.dart';
import '../../../common/utils/utils.dart';

enum SingingCharacter { uzbek, english, russian }

class DrawerUserWidget extends StatefulWidget {
  const DrawerUserWidget({super.key});

  @override
  State<DrawerUserWidget> createState() => _DrawerUserWidgetState();
}

class _DrawerUserWidgetState extends State<DrawerUserWidget> {
  String name = LocalDataService.getUser().$1;
  String phone = LocalDataService.getUser().$2;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ColoredBox(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 3),

              /// User Name
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.userName,
                        style: Styles.w700_25.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        name,
                        style: Styles.w700,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),

              /// User Phone
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.userPhone,
                        style: Styles.w700_25.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        phone,
                        style: Styles.w700,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Language
              CupertinoButton(
                onPressed: _onPressLang,
                child:  Row(
                  children: [
                    const Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        context.l10n.language,
                        textAlign: TextAlign.center,
                        style: Styles.w700,
                      ),
                    ),
                  ],
                ),
              ),

              /// Delete account
              CupertinoButton(
                onPressed: _onPressDelete,
                child:  Row(
                  children: [
                    const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        context.l10n.myData,
                        textAlign: TextAlign.center,
                        style: Styles.w700,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(flex: 30),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressDelete() async {
    await LocalDataService.clearUser();
  }

  void _onPressLang() async {
    await AppUtils.languagePicker(context);
  }
}
