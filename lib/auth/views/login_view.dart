import 'dart:math';
import 'package:provider/provider.dart';
import '../../providers/auth.dart';
import 'package:flutter/material.dart';
// widgets
import '../../general/logo.dart';
import '../widgets/login_input.dart';
import '../../general/action_button.dart';
// data types
import '../../data_types/login_data.dart';
import '../../data_types/response.dart';
// configs
import '../../general/text_style_configs.dart';
// colors
import '../../general/app_colors.dart';
// helper
import '../../helper.dart';

class LoginView extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final form = GlobalKey<FormState>();
  LoginData info = new LoginData();
  var isLoading = false;

  void _login() async {
    setState(() {
      isLoading = !isLoading;
    });
    // final isValid = form.currentState.validate();

    // if (isValid) {
    //   setState(() {
    //     isLoading = true;
    //   });
    //   form.currentState.save();

    //   var res = await Provider.of<Auth>(context, listen: false).logIn(
    //     email: info.email,
    //     password: info.password,
    //   );

    //   setState(() {
    //     isLoading = false;
    //   });

    //   Helper.showMessage(context, res.message);
    //   print(res.success);
    //   print(res.message);
    //   if (res.success) {
    //     Navigator.of(context).pushReplacementNamed('/initial');
    //   }
    // } else {
    //   Helper.showMessage(context, '${Response.fieldsErrorMessage}');
    // }
  }

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: AppColors.SECONDARY_DARK,
      body: SafeArea(
        child: Center(
          child: Container(
            alignment: Alignment.center,
            width: min(800.0, mediaQuery.size.width),
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyleConfigs.lightTitle,
                      ),
                    ],
                  ),
                  Logo(),
                  LoginInput(form: form, info: info),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ActionButton(
                        function: _login,
                        isLoading: isLoading,
                        title: 'Login',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
