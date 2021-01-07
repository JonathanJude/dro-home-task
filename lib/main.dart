import 'package:drohealth_assessment/ui/views/bag_panel.dart';
import 'package:drohealth_assessment/ui/views/splash_page.dart';
import 'package:drohealth_assessment/ui/views/store.dart';
import 'package:drohealth_assessment/providers/set_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:drohealth_assessment/styles/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DRO Health',
        theme: appThemeData(),
        home: SplashPage(),
      ),
    );
  }
}
