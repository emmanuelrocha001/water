import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/water.dart';
import './providers/color.dart';

// views
import './auth/views/login_view.dart';
import './auth/views/create_account_view.dart';
import 'package:water_tracker/screens/overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // use when new instance is created
          create: (ctx) => Water(),
        ),
        ChangeNotifierProvider(
          // use when new instance is created
          create: (ctx) => AppColor(),
        ),
      ],
      child: App(),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppColor>(
      builder: (context, color, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Water',
        theme: ThemeData(
          primarySwatch: color.appColor,
          accentColor: Colors.black,
          // brightness: Brightness.dark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: CreateAccountView(),
        routes: {
          LoginView.routeName: (ctx) => LoginView(),
          CreateAccountView.routeName: (ctx) => CreateAccountView(),
          OverviewScreen.routeName: (ctx) => OverviewScreen(),
        },
      ),
    );
  }
}
