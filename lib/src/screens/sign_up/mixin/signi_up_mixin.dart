part of '../sign_up.dart';

mixin SignUpMixin on State<SignUpScree> {

  ValueNotifier<bool> isObscure = ValueNotifier(false);

  late TextEditingController controllerName ;
  late TextEditingController controllerEmail ;
  late TextEditingController controllerPassword ;
  late TextEditingController controllerCPassword ;
  late TextEditingController controllerPhone ;

  @override
  void initState() {
    controllerName = TextEditingController();
    controllerEmail = TextEditingController();
    controllerPassword = TextEditingController();
    controllerCPassword = TextEditingController();
    controllerPhone = TextEditingController();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final _formPhone = GlobalKey<FormState>();
  bool passwordSee = true;
  bool password = true;

  String? validateEmail(String? value) {
    RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@gmail.com$');
    if (value != null && value.isEmpty) {
      return "Write your email";
    }else if(!regex.hasMatch(value!)){
      return "Invalid Email" ;
    }
    return null;
  }

  String? validateName(String? value) {
    if (value != null && value.isEmpty) {
      return "Write your name";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value != null && value.isEmpty) {
      return "Write your password";
    } else if(value!.length < 8){
      return "Password must be at least 8 characters";
    }
    return null;
  }

  String? validateCPassword(String? value) {
    if (value != null && value.isEmpty) {
      return "Write your confirm password";
    } else if(controllerPassword.text != controllerCPassword.text){
      return "your password does not match";
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
