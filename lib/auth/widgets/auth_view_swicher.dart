import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth.dart';
// views
import '../../auth/views/login_view.dart';
import '../../auth/views/create_account_view.dart';
// text style
import '../../general/text_style_configs.dart';

class AuthViewSwitcher extends StatelessWidget {
  final hasAccount;
  AuthViewSwitcher({
    @required this.hasAccount,
  });

  void _navigate(BuildContext context) async {
    // set new initial view and navigate
    if (hasAccount) {
      await Provider.of<Auth>(context, listen: false).setInitialView(
        view: CreateAccountView.routeName,
      );
      Navigator.of(context).pushReplacementNamed(CreateAccountView.routeName);
    } else {
      await Provider.of<Auth>(context, listen: false).setInitialView(
        view: LoginView.routeName,
      );
      Navigator.of(context).pushReplacementNamed(LoginView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _navigate(context);
      },
      child: Ink(
          height: 50,
          // color: Colors.red,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              hasAccount
                  ? 'Dont\'t have an account? Create a Water Tracker Account'
                  : 'Already have an account? Login',
              overflow: TextOverflow.ellipsis,
              style: TextStyleConfigs.lightInteractable,
            ),
          )),
    );
  }
}
