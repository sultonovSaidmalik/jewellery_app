import 'package:flutter/cupertino.dart';
import 'package:jewellery_app/src/common/constants/strings.dart';
import '../../../common/constants/text_style.dart';
class RegistrationButton extends StatelessWidget {
  final void Function()? onPressed;
  const RegistrationButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.07,
        child:  DecoratedBox(
          decoration: const BoxDecoration(
            color: Color(0xFF313131),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Center(
            child: Text(
              Strings.registration.text,
              textAlign: TextAlign.center,
              style: Styles.w600_20,
            ),
          ),
        ),
      ),
    );
  }
}
