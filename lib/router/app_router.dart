import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../auth/authentication_bloc.dart';
import '../auth/authentication_state.dart';
import '../models/book.dart';
import '../views/app_shell.dart';
import '../views/login_page.dart';
import '../views/book_list_page.dart';
import '../views/book_detail_page.dart';
import '../views/profile_page.dart';
import 'refresh_listenable.dart';

GoRouter createRouter(AuthenticationBloc authBloc) {
  return GoRouter(
    initialLocation: '/login',
    refreshListenable: RefreshListenable(authBloc.stream),
    redirect: (BuildContext context, GoRouterState state) {
      final currentPath = state.uri.path;
      final isLoggedIn = authBloc.state is LoggedIn;
      final isLoginPath = currentPath == '/login';

      if (isLoggedIn && isLoginPath) {
        return '/byAuthor';
      }

      if (!isLoggedIn && !isLoginPath) {
        return '/login';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return AppShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            redirect: (context, state) => '/byAuthor',
          ),
          GoRoute(
            path: '/byAuthor',
            name: 'byAuthor',
            builder: (context, state) {
              return const BookListPage(sortType: BookSortType.author);
            },
            routes: [
              GoRoute(
                path: 'detail',
                name: 'byAuthorDetail',
                builder: (context, state) {
                  final book = state.extra as Book?;
                  return BookDetailPage(book: book);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/byTitle',
            name: 'byTitle',
            builder: (context, state) {
              return const BookListPage(sortType: BookSortType.title);
            },
            routes: [
              GoRoute(
                path: 'detail',
                name: 'byTitleDetail',
                builder: (context, state) {
                  final book = state.extra as Book?;
                  return BookDetailPage(book: book);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),
    ],
  );
}
