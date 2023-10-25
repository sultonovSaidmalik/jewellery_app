import 'package:flutter/cupertino.dart';
import '../../../common/constants/text_style.dart';
class SignInButton extends StatelessWidget {
  final void Function()? onPressed;
  const SignInButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.07,
        child: const DecoratedBox(
          decoration: BoxDecoration(
            color: Color(0xFF313131),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Center(
            child: Text(
              'Sign-In',
              textAlign: TextAlign.center,
              style: Styles.w600_20,
            ),
          ),
        ),
      ),
    );
  }
}
