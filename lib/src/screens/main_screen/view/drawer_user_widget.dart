import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_app/src/common/constants/strings.dart';

import '../../../common/constants/text_style.dart';
enum SingingCharacter { uzbek, english, russian }
class DrawerUserWidget extends StatefulWidget {
  final void Function() deleteOnTap;
  final void Function() logOutOnTap;
  final String languageText;
  final String deleteText;
  final String logOutText;

  const DrawerUserWidget({
    super.key,
    required this.deleteOnTap,
    required this.logOutOnTap,
    required this.languageText,
    required this.deleteText,
    required this.logOutText,
  });

  @override
  State<DrawerUserWidget> createState() => _DrawerUserWidgetState();
}

class _DrawerUserWidgetState extends State<DrawerUserWidget> {
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
                        Strings.userName.text,
                        style: Styles.w700_25.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Sarvar",
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
                        Strings.userPhone.text,
                        style: Styles.w700_25.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "+998998288480",
                        style: Styles.w700,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Language
              CupertinoButton(
                onPressed: (){
                  languagePicker(context);
                  setState(() {

                  });
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

              /// Delete account
              CupertinoButton(
                onPressed: widget.deleteOnTap,
                child: Row(
                  children: [
                    const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        widget.deleteText,
                        textAlign: TextAlign.center,
                        style: Styles.w700,
                      ),
                    ),
                  ],
                ),
              ),

              /// Log Out
              CupertinoButton(
                onPressed: widget.logOutOnTap,
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        widget.logOutText,
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
}
