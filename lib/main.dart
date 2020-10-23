import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/water.dart';
import './providers/color.dart';
import 'package:water_tracker/screens/overview_screen.dart';
import './screens/authentication_screen.dart';

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
        create: (ctx) => Water(),),
        ChangeNotifierProvider(
        // use when new instance is created
        create: (ctx) => AppColor(),),
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

          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthenticationScreen(),

        routes: {
          AuthenticationScreen.routeName: (ctx) => AuthenticationScreen(),
          OverviewScreen.routeName: (ctx) => OverviewScreen(),
        },
      ),
    );
  }
}

