import 'dart:math';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';
import '../../providers/auth.dart';
import 'package:flutter/material.dart';
// widgets
import '../widgets/auth_view_swicher.dart';
import '../../general/date_picker.dart';
import '../../general/logo.dart';
import '../widgets/create_account_input.dart';
import '../../general/action_button.dart';
// data types
import '../../data_types/create_account_data.dart';
import '../../data_types/response.dart';
// configs
import '../../general/text_style_configs.dart';
// colors
import '../../providers/app_color.dart';
// helper
import '../../helper.dart';

class CreateAccountView extends StatefulWidget {
  static const routeName = '/create-account';

  @override
  _CreateAccountViewState createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final form = GlobalKey<FormState>();
  CreateAccountData info = new CreateAccountData();
  DateTime _birthDate;
  var isLoading = false;

  void setBirthDate(DateTime date) {
    _birthDate = date;
  }

  void _createAccount() async {
    setState(() {
      isLoading = !isLoading;
    });
    if (_birthDate != null) {
      print('${DateFormat('MM/dd/yyyy').format(_birthDate)}');
    }
    final isValid = form.currentState.validate();

    if (isValid) {
      if (_birthDate == null) {
        Helper.showMessage(context, 'Please set your Date of Birth');
        return;
      }
      setState(() {
        isLoading = true;
      });
      form.currentState.save();

      // var res = await Provider.of<Auth>(context, listen: false).logIn(
      //   email: info.email,
      //   password: info.password,
      // );

      setState(() {
        isLoading = false;
      });

      // Helper.showMessage(context, res.message);
      // print(res.success);
      // print(res.message);
      // if (res.success) {
      //   Navigator.of(context).pushReplacementNamed('/initial');
      // }
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: AppColor.SECONDARY_DARK,
      body: SafeArea(
        child: Center(
          child: Container(
            alignment: Alignment.center,
            width: min(800.0, mediaQuery.size.width),
            // padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Create Account',
                          style: TextStyleConfigs.lightTitle,
                        ),
                      ),
                    ],
                  ),
                  Logo(),
                  CreateAccountInput(form: form, info: info),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DatePicker(
                      setDate: setBirthDate,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ActionButton(
                        function: _createAccount,
                        isLoading: isLoading,
                        title: 'Submit',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: AuthViewSwitcher(
        hasAccount: false,
      ),
    );
  }
}
