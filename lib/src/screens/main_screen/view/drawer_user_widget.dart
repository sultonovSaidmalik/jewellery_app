import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/constants/text_style.dart';

class DrawerUserWidget extends StatelessWidget {
  final void Function() languageOnTap;
  final void Function() deleteOnTap;
  final void Function() logOutOnTap;
  final String languageText;
  final String deleteText;
  final String logOutText;

  const DrawerUserWidget({
    super.key,
    required this.languageOnTap,
    required this.deleteOnTap,
    required this.logOutOnTap,
    required this.languageText,
    required this.deleteText,
    required this.logOutText,
  });

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
                        "User Name",
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
                        "User Phone",
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
                onPressed: languageOnTap,
                child: Row(
                  children: [
                    const Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        languageText,
                        textAlign: TextAlign.center,
                        style: Styles.w700,
                      ),
                    ),
                  ],
                ),
              ),

              /// Delete account
              CupertinoButton(
                onPressed: deleteOnTap,
                child: Row(
                  children: [
                    const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        deleteText,
                        textAlign: TextAlign.center,
                        style: Styles.w700,
                      ),
                    ),
                  ],
                ),
              ),

              /// Log Out
              CupertinoButton(
                onPressed: logOutOnTap,
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        logOutText,
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
