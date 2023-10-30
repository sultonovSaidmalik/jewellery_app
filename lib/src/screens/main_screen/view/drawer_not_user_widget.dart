import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_app/src/common/constants/strings.dart';
import '../../../common/constants/text_style.dart';

enum SingingCharacter { uzbek, english, russian }

class DrawerNotUserWidget extends StatefulWidget {
  final void Function() signInOnTap;
  final String languageText;
  final String signInText;

  const DrawerNotUserWidget({
    super.key,
    required this.signInOnTap,
    required this.languageText,
    required this.signInText,
  });

  @override
  State<DrawerNotUserWidget> createState() => _DrawerNotUserWidgetState();
}


class _DrawerNotUserWidgetState extends State<DrawerNotUserWidget> {
  SingingCharacter? _character = SingingCharacter.english;
  languagePicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              RadioListTile<SingingCharacter>(
                controlAffinity: ListTileControlAffinity.trailing,
                title:  Row(
                  children: [
                    CircleFlag("uz", size: 30,),
                    const Spacer(),
                    Text(Strings.uzbek.text),
                    const Spacer(flex: 6),
                  ],
                ),
                value: SingingCharacter.uzbek,
                groupValue: _character,
                onChanged:(SingingCharacter? value) {
                  _character=value;
                },
              ),
              RadioListTile<SingingCharacter>(
                controlAffinity: ListTileControlAffinity.trailing,
                title:  Row(
                  children: [
                    CircleFlag("us", size: 30,),
                    const Spacer(),
                    Text(Strings.english.text),
                    const Spacer(flex: 6),
                  ],
                ),
                value: SingingCharacter.english,
                groupValue: _character,
                onChanged:(SingingCharacter? value) {
                  _character=value;
                },
              ),
              RadioListTile<SingingCharacter>(
                controlAffinity: ListTileControlAffinity.trailing,
                title:  Row(
                  children: [
                    CircleFlag("ru", size: 30,),
                    const Spacer(),
                    Text(Strings.russian.text),
                    const Spacer(flex: 6),
                  ],
                ),
                value: SingingCharacter.russian,
                groupValue: _character,
                onChanged:(SingingCharacter? value) {
                  _character=value;
                },
              ),
            ],
          ),
        );
      },
    );
  }

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
                onPressed: () {
                  languagePicker(context);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        widget.languageText,
                        textAlign: TextAlign.center,
                        style: Styles.w700,
                      ),
                    ),
                  ],
                ),
              ),

              /// Sign In
              CupertinoButton(
                onPressed: widget.signInOnTap,
                child: Row(
                  children: [
                    const Icon(
                      Icons.create,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        widget.signInText,
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
}
