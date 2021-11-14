import 'package:driver_app/pages/home_page.dart';
import 'package:driver_app/routes/routes.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.home: (_) => const HomePage(),
      /*Routes.splash: (_) => const SplashPage(),
      Routes.login: (_) => const LoginPage(),
      Routes.register: (_) => RegisterPage(),*/
    };
