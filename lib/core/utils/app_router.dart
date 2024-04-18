import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/search/presentation/views/search_view.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/HomeView';
  static const kSplashView = '/';
  static const kBookDetailsView = '/BookDetailsView';
  static const kSearchView = '/SearchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        pageBuilder: (context, state) => const MaterialPage(
          child: SplashView(),
        ),
      ),
      GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) => const MaterialPage(
          child: HomeView(),
        ),
      ),
      GoRoute(
        path: kBookDetailsView,
        pageBuilder: (context, state) => const MaterialPage(
          child: BookDetailsView(),
        ),
      ),
      GoRoute(
        path: kSearchView,
        pageBuilder: (context, state) => const MaterialPage(
          child: SearchView(),
        ),
      ),
    ],
  );
}
