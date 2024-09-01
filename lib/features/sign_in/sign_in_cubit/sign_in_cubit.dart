import 'package:e_commerce_app/features/sign_up/sign_up_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInViewModel extends Cubit<SignUpState> {
  SignInViewModel() : super(SignUpLoadingState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  void signUp() async {
    if (formKey.currentState?.validate() == true) {}
  }
}
