part of '../sign_up.dart';

mixin SignUpMixin on State<SignUpScree> {

  ValueNotifier<bool> isObscure = ValueNotifier(false);

  late TextEditingController controllerName ;
  late TextEditingController controllerEmail ;
  late TextEditingController controllerPassword ;
  late TextEditingController controllerCPassword ;

  @override
  void initState() {
    controllerName = TextEditingController();
    controllerEmail = TextEditingController();
    controllerPassword = TextEditingController();
    controllerCPassword = TextEditingController();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  bool passwordSee = true;
  bool password = true;

  String? validateEmail(String? value) {
    RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@gmail.com$');
    if (value != null && value.isEmpty) {
      return Strings.validEmail.text;
    }else if(!regex.hasMatch(value!)){
      return Strings.invalidEmail.text ;
    }
    return null;
  }

  String? validateName(String? value) {
    if (value != null && value.isEmpty) {
      return Strings.validName.text;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value != null && value.isEmpty) {
      return Strings.validPassword.text;
    } else if(value!.length < 8){
      return Strings.invalidPassword.text;
    }
    return null;
  }

  String? validateCPassword(String? value) {
    if (value != null && value.isEmpty) {
      return Strings.validConfirmPassword.text;
    } else if(controllerPassword.text != controllerCPassword.text){
      return Strings.invalidConfirmPassword.text;
    }
    return null;
  }

  String? validatePhone(String? value) {
    RegExp regex = RegExp(r'(^\+998\d{9})');
    if (value != null && value.isEmpty) {
      return "Write your phone";
    }else if(!regex.hasMatch(value!)){
      return "Invalid phone number";
    }
    return null;
  }
}
