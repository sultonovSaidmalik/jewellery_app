import 'package:flutter/material.dart';
import 'package:jewellery_app/src/common/ext/context_ext.dart';
import 'package:jewellery_app/src/common/utils/utils.dart';

mixin ConnectivityMixin {
  void checkerListener(BuildContext context, bool connection) {
    if (!connection) {
      AppUtils.msg(context, context.l10n.connect, color: Colors.red);
    } else {
      // AppUtils.share(title: "Salom");
    }
  }
}
