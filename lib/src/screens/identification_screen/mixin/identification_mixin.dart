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
      return Strings.validName.text;
    }
    return null;
  }

  String? validatePhone(String? value) {
    RegExp regex = RegExp(r'(^\+998\d{9})');
    if (value != null && value.isEmpty) {
      return Strings.validPhone.text;
    } else if (!regex.hasMatch(value!)) {
      return Strings.invalidPhone.text;
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
              Strings.your.text,
              style: Styles.w400_15.copyWith(
                color: Colors.black,
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child:  Text(Strings.ok.text),
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
