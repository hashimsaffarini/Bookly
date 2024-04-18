import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => const MaterialPage(
          child: SplashView(),
        ),
      ),
      GoRoute(
        path: '/HomeView',
        pageBuilder: (context, state) => const MaterialPage(
          child: HomeView(),
        ),
      ),
    ],
  );
}
