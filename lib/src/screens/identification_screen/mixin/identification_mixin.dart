part of '../identification_screen.dart';

mixin IdentificationMixin on State<IdentificationScreen> {
  ValueNotifier<bool> isObscure = ValueNotifier(false);

  late TextEditingController controllerName;

  late TextEditingController controllerPhone;

  @override
  void initState() {
    controllerName = TextEditingController();
    controllerPhone = TextEditingController();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  String? validateName(String? value) {
    if (value != null && value.isEmpty) {
      return context.l10n.validName;
    }
    return null;
  }

  String? validatePhone(String? value) {
    RegExp regex = RegExp(r'(^\+998\d{9})');
    if (value != null && value.isEmpty) {
      return context.l10n.validPhone;
    } else if (!regex.hasMatch(value!)) {
      return context.l10n.invalidPhone;
    }
    return null;
  }

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Text(
              context.l10n.your,
              style: Styles.w400_15.copyWith(
                color: Colors.black,
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child:  Text(context.l10n.ok),
              onPressed: () {
                context.pushReplacementNamed(Routes.main);
              },
            ),
          ],
        );
      },
    );
  }
}
