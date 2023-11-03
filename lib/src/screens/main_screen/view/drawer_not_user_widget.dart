import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jewellery_app/src/common/constants/app_router.dart';
import 'package:jewellery_app/src/common/ext/context_ext.dart';
import '../../../common/constants/text_style.dart';
import '../../../common/utils/utils.dart';

enum SingingCharacter { uzbek, english, russian }

class DrawerNotUserWidget extends StatefulWidget {


  const DrawerNotUserWidget({
    super.key,

  });

  @override
  State<DrawerNotUserWidget> createState() => _DrawerNotUserWidgetState();
}

class _DrawerNotUserWidgetState extends State<DrawerNotUserWidget> {
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
              const Spacer(flex: 5),

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

              /// Sign In
              CupertinoButton(
                onPressed: _onPressIdentification,
                child:  Row(
                  children: [
                    const Icon(
                      Icons.create,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        context.l10n.identification,
                        textAlign: TextAlign.center,
                        style: Styles.w700,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(flex: 25),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressLang() async {
    await AppUtils.languagePicker(context);
  }

  void _onPressIdentification() {
    context.pushNamed(Routes.identification);
  }
}
