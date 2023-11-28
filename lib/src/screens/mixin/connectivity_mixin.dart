import 'package:flutter/material.dart';
import 'package:jewellery_app/src/common/ext/context_ext.dart';
import 'package:jewellery_app/src/common/utils/utils.dart';

mixin ConnectivityMixin {
  void checkerListener(BuildContext context, bool connection) {
    if (!connection) {
      AppUtils.msgWarning(context, context.l10n.connect);
    } else {
      // AppUtils.share(title: "Salom");
    }
  }
}
