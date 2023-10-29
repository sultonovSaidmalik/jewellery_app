import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../common/constants/strings.dart';
import '../../../common/constants/text_style.dart';
class TextWidgetSignUp extends StatelessWidget {
  final void Function() onTap;
  const TextWidgetSignUp({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: Strings.already.text,
              style: Styles.textStyle.copyWith(
                color: Colors.white
                    .withOpacity(0.699999988079071),
              ),
            ),
            const TextSpan(
              text: '      ',
              style: Styles.textStyle,
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = onTap,
              text: Strings.signIn.text,
              style: Styles.textStyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
