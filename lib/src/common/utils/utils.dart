import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

import '../../../app_options.dart';
import '../constants/strings.dart';
import '../service/local_dara_service.dart';

class AppUtils {
  AppUtils._();

  static void msg(BuildContext context, String message,
      {Color color = Colors.green}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.vertical,
        content: Text(message),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 150,
          left: 10,
          right: 10,
        ),
      ),
    );
  }

  static Future<bool> share({
    required String title,
    String? text,
    String? linkUrl,
    String? chooserTitle,
  }) async {
    return (await FlutterShare.share(
          title: title,
          text: text,
          linkUrl: linkUrl,
          chooserTitle: chooserTitle,
        )) ??
        false;
  }

  static Future<void> languagePicker(context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ValueListenableBuilder(
          valueListenable: LocalDataService.localeListenable,
          builder: (context, box, __) {
            String locale = box.get("locale", defaultValue: "uz") as String;
            return Wrap(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 15, right: 40),
                  leading: CircleFlag(
                    "uz",
                    size: 30,
                  ),
                  onTap: () {
                    AppOptions.update(
                      context,
                      AppOptions.of(context)
                          .copyWith(locale: const Locale("uz")),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  title: Text(Strings.uzbek.text),
                  trailing: Icon(
                    locale == "uz" ? Icons.circle : Icons.circle_outlined,
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 15, right: 40),
                  leading: CircleFlag(
                    "us",
                    size: 30,
                  ),
                  onTap: () {
                    AppOptions.update(
                      context,
                      AppOptions.of(context)
                          .copyWith(locale: const Locale("en")),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  title: Text(Strings.english.text),
                  trailing: Icon(
                    locale == "en" ? Icons.circle : Icons.circle_outlined,
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 15, right: 40),
                  leading: CircleFlag(
                    "ru",
                    size: 30,
                  ),
                  onTap: () {
                    AppOptions.update(
                      context,
                      AppOptions.of(context)
                          .copyWith(locale: const Locale("ru")),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  title: Text(Strings.russian.text),
                  trailing: Icon(
                    locale == "ru" ? Icons.circle : Icons.circle_outlined,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
