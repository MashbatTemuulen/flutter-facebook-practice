import 'package:facebook/global_keys.dart';
import 'package:facebook/provider/common.dart';
import 'package:facebook/provider/loader.dart';
import 'package:facebook/routes/index.dart';
import 'package:facebook/screens/home/index.dart';
import 'package:facebook/screens/login.dart';
import 'package:facebook/themes/dark.dart';
import 'package:facebook/themes/light.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  String? userProflie;
  void initState() {
    super.initState();
    initialLocalStorage();
  }

  void initialLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userProflie = prefs.getString("userProfile");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoaderProvider()),
          ChangeNotifierProvider(create: (_) => CommonProvider())
        ],
        child: Consumer<CommonProvider>(
          builder: (context, value, child) {
            return MaterialApp(
              title: 'Facebook',
              routes: routes,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: value.themeMode,
              navigatorKey: GlobalKeys.navigatorKey,
              home: userProflie != null ? HomePage() : LoginPage(),
            );
          },
        ));
  }
}
