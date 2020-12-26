import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/auth.dart';
import './providers/water.dart';
import 'providers/app_color.dart';

// views
import './auth/views/splash_view.dart';
import './auth/views/login_view.dart';
import './auth/views/create_account_view.dart';
import 'package:water_tracker/screens/overview_view.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Water(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => AppColor(),
        ),
      ],
      child: Consumer<AppColor>(
        builder: (context, color, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Water',
          theme: ThemeData(
            primarySwatch: color.appColor,
            accentColor: Colors.black,
            // brightness: Brightness.dark,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: InitialView(),
          routes: {
            InitialView.routeName: (ctx) => InitialView(),
            LoginView.routeName: (ctx) => LoginView(),
            CreateAccountView.routeName: (ctx) => CreateAccountView(),
            OverviewView.routeName: (ctx) => OverviewView(),
          },
        ),
      ),
    );
  }
}

class InitialView extends StatefulWidget {
  static final routeName = '/initial';

  @override
  _InitialViewState createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {
  var initalized = false;
  void _navigate({@required String initial}) async {
    // get updated token
    // await Provider.of<Auth>(context, listen: false).login();

    switch (initial) {
      case LoginView.routeName:
        Navigator.of(context).pushReplacementNamed(LoginView.routeName);
        break;

      case CreateAccountView.routeName:
        Navigator.of(context).pushReplacementNamed(CreateAccountView.routeName);
        break;

      case OverviewView.routeName:
        Navigator.of(context).pushReplacementNamed(OverviewView.routeName);
        break;

      default:
        Navigator.of(context).pushReplacementNamed(LoginView.routeName);
        break;
        break;
    }
  }

  void _getInitialView() async {
    await Provider.of<Auth>(context, listen: false).initial();
    // if (Provider.of<Auth>(context, listen: false).token != '') {
    //   // var res = await Provider.of<Auth>(context, listen: false).getUserInfo();
    //   // if (res.success) {
    //   //   var initial = Provider.of<Auth>(context, listen: false).initialView;
    //   //   _navigate(initial: initial);
    //   //   return;
    //   // }
    //   var initial = Provider.of<Auth>(context, listen: false).initialView;
    //   _navigate(initial: initial);
    //   return;
    // }
    var initial = Provider.of<Auth>(context, listen: false).initialView;
    print(initial);
    _navigate(initial: initial);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), _getInitialView);
  }

  @override
  Widget build(BuildContext context) {
    return SplashView();
  }
}
