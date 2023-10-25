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
      return "Write your email";
    }else if(!regex.hasMatch(value!)){
      return "Invalid Email" ;
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


}
