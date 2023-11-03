import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

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
}
