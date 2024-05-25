import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly_app/features/home/presentation/manager/cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/service_locator.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/search/data/repo/search_repo_implementation.dart';
import 'package:bookly_app/features/search/presentation/manager/cubit/search_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/', // (/) ==> start from first screen
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      // GoRoute(
      //   path: kSearchView,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const SearchView();
      //   },
      // ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) {
          return BlocProvider(
              create: (context) =>
                  SimilarBooksCubit(getIt.get<HomeRepoImplementations>()),
              child: BookDetailsView(
                bookModel: state.extra as BookModel,
              ));
        },
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) {
          return BlocProvider(
              create: (context) =>
                  SearchBooksCubit(getIt.get<SearchRepoImplementation>()),
              child: const SearchView());
        },
      ),
    ],
  );
}
