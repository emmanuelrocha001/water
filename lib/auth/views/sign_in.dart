import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../screens/overview_screen.dart';
import '../../widgets/general/loading.dart';
import '../../general/app_colors.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  var _hidePassword = true;
  var _loading = false;

  void _login() {
    setState(() {
      _loading = true;
    });
    Navigator.of(context).pushReplacementNamed(OverviewScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final styleTheme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return Center(
      child: SingleChildScrollView(
        child: Container(
          // color: Colors.red,
          width: min(400, mediaQuery.size.width),
          height: 400,

          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(
                      Feather.droplet,
                      color: Colors.white,
                      size: 150,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Water',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    // email field
                    TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Feather.user,
                          color: Colors.white,
                        ),
                        hintText: 'Email',
                        isDense: true,
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: styleTheme.primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    // password field
                    TextFormField(
                      obscureText: _hidePassword,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Feather.lock,
                          color: Colors.white,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _hidePassword ? Feather.eye_off : Feather.eye,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _hidePassword = !_hidePassword;
                            });
                          },
                        ),
                        hintText: 'Password',
                        isDense: true,
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: styleTheme.primaryColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.SECONDARY_DARK,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    title: FlatButton(
                      shape: RoundedRectangleBorder(
                        // side: BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: _loading
                          ? Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Loading(),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                      onPressed: () {
                        _login();
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
