import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

// data types
import '../../data_types/login_data.dart';

class LoginInput extends StatefulWidget {
  final form;
  final LoginData info;

  LoginInput({
    @required this.form,
    @required this.info,
  });

  @override
  _LoginInputState createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  var _hidePassword = true;
  var isLoading = false;

  final _passwordNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final styleTheme = Theme.of(context);
    // final mediaQuery = MediaQuery.of(context);

    return Form(
      key: widget.form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // email field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              initialValue: widget.info.email,

              // focus
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_passwordNode);
              },
              // validates input
              autofocus: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value.isEmpty) {
                  return '* Required Field';
                } else {
                  bool valid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value.replaceAll(' ', ''));

                  if (valid) {
                    return null;
                  } else {
                    return '* Email is not valid';
                  }
                }
              },
              onSaved: (newValue) {
                widget.info.email = newValue.replaceAll(' ', '');
              },
              style: TextStyle(color: Colors.white),
              // styling
              decoration: InputDecoration(
                fillColor: Colors.white,
                labelStyle: TextStyle(color: Colors.white),

                labelText: 'Email',
                // hintText: 'Email',
                isDense: true,
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(.85),
                ),

                border: OutlineInputBorder(
                  borderSide: BorderSide(color: styleTheme.primaryColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabled: true,
              ),
            ),
          ),

          // password input
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: widget.info.password,
              obscureText: _hidePassword,
              keyboardType: TextInputType.visiblePassword,

              // focus
              focusNode: _passwordNode,
              textInputAction: TextInputAction.done,
              // onFieldSubmitted: (_) {
              //   FocusScope.of(context).requestFocus(_confirmPasswordNode);
              // },
              // validates input
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value.isEmpty) {
                  return '* Required Field';
                } else {
                  return null;
                }
              },
              onSaved: (newValue) {
                widget.info.password = newValue.replaceAll(' ', '');
              },
              style: TextStyle(color: Colors.white),
              // styling
              decoration: InputDecoration(
                labelText: 'Password',
                // hintText: 'Email',
                isDense: true,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: styleTheme.primaryColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelStyle: TextStyle(color: Colors.white),
                enabled: true,
                // disabledBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: styleTheme.primaryColor),
                // ),

                suffixIcon: IconButton(
                  icon: Icon(
                    _hidePassword ? Feather.eye : Feather.eye_off,
                    color: styleTheme.primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _hidePassword = !_hidePassword;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
