import 'package:flutter/material.dart';
import '../widgets/authentication/sign_in.dart';
import '../app_colors.dart';

class AuthenticationScreen extends StatelessWidget {

  static const routeName = '/authentication';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PRIMARY_DARK,
      body: SignIn(),
    );
  }
}
