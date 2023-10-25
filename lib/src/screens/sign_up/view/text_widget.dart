import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../common/constants/text_style.dart';
class TextWidget extends StatelessWidget {
  final void Function() onTap;
  const TextWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account?',
              style: Styles.textStyle.copyWith(
                color: Colors.white
                    .withOpacity(0.699999988079071),
              ),
            ),
            const TextSpan(
              text: ' ',
              style: Styles.textStyle,
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = onTap,
              text: 'Sign in',
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
