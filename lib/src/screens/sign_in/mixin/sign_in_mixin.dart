part of '../sign_in.dart';

mixin SignInMixin on State<SignInScreen> {

  late TextEditingController controllerEmail ;
  late TextEditingController controllerPassword ;

  @override
  void initState() {
    controllerEmail = TextEditingController();
    controllerPassword = TextEditingController();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  bool password = true;

  String? validateEmail(String? value) {
    RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@gmail.com$');
    if (value != null && value.isEmpty) {
      return Strings.validEmail.text;
    }else if(!regex.hasMatch(value!)){
      return Strings.invalidEmail.text;
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


}
