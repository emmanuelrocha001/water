import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

// data types
import '../../data_types/create_account_data.dart';

class CreateAccountInput extends StatefulWidget {
  final form;
  final CreateAccountData info;

  CreateAccountInput({
    @required this.form,
    @required this.info,
  });

  @override
  _CreateAccountInputState createState() => _CreateAccountInputState();
}

class _CreateAccountInputState extends State<CreateAccountInput> {
  var _hidePassword = true;
  var _currentPassword = '';
  var isLoading = false;

  final _lastNameNode = FocusNode();
  final _emailNode = FocusNode();
  final _passwordNode = FocusNode();
  final _confirmPasswordNode = FocusNode();

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
          // first name
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: widget.info.firstName,
              keyboardType: TextInputType.text,

              // focus
              autofocus: true,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_lastNameNode);
              },
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
                widget.info.firstName = newValue.trim();
              },

              style: TextStyle(color: Colors.white),
              // styling
              decoration: InputDecoration(
                labelText: 'First Name',
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
              ),
            ),
          ),

          // last name
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: widget.info.firstName,
              keyboardType: TextInputType.text,

              // focus
              focusNode: _lastNameNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_emailNode);
              },
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
                widget.info.firstName = newValue.trim();
              },

              style: TextStyle(color: Colors.white),
              // styling
              decoration: InputDecoration(
                labelText: 'First Name',
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
              ),
            ),
          ),
          // email field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              initialValue: widget.info.email,

              // focus
              focusNode: _emailNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_passwordNode);
              },
              // validates input
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
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_confirmPasswordNode);
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value.isEmpty) {
                  return '* Required Field';
                } else {
                  return null;
                }
              },
              onChanged: (newValue) {
                _currentPassword = newValue.trim();
              },
              onSaved: (newValue) {
                widget.info.password = newValue.trim();
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

          // confirm password input
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              initialValue: '',
              obscureText: _hidePassword,
              keyboardType: TextInputType.visiblePassword,

              // focus
              focusNode: _confirmPasswordNode,
              textInputAction: TextInputAction.done,

              // validates input
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value.isEmpty) {
                  return '* Required Field';
                } else {
                  if (value != _currentPassword) {
                    return '* Password does not match';
                  }
                  return null;
                }
              },
              onSaved: (newValue) {
                // widget.info.password = newValue.replaceAll(' ', '');
              },
              style: TextStyle(color: Colors.white),
              // styling
              decoration: InputDecoration(
                labelText: 'Confirm Password',
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
