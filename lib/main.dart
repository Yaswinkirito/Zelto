import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zelto/pages/home.dart';

import 'package:zelto/pages/login.dart';
import 'package:zelto/pages/login_skip.dart';
import 'package:zelto/pages/otp_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Login();
      },
    ),
    GoRoute(
      path: '/Otp',
      builder: (BuildContext context, GoRouterState state) {
        return const Otp();
      },
    ),
    GoRoute(
      path: '/Home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/loginskip',
      builder: (BuildContext context, GoRouterState state) {
        return const SkipLogin();
      },
    )
  ],
);
