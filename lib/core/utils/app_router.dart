import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repo/home_repo_implement.dart';
import 'package:bookly_app/Features/home/presentaion/manager/similar_books_cubit/similar_books_cubit_cubit.dart';
import 'package:bookly_app/Features/home/presentaion/views/book_details_view.dart';
import 'package:bookly_app/Features/home/presentaion/views/Home_view.dart';
import 'package:bookly_app/Features/search/data/repo/search_repo_impl.dart';
import 'package:bookly_app/Features/search/presentaion/manager/search_cubit/search_cubit.dart';
import 'package:bookly_app/Features/search/presentaion/views/search_view.dart';
import 'package:bookly_app/Features/splash/presentaion/views/splash_view.dart';
import 'package:bookly_app/core/utils/services_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeview';
  static const kBookDetailsView = '/BookDetailsViewview';
  static const ksearchView = '/searchview';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubitCubit(
            getIt.get<HomeRepoImplemet>(),
          ),
          child: BookDetailsView(
            bookModel: state.extra! as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: ksearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchbookCubit(
            getIt.get<SearchRepoImple>(),
          ),
          child: const SearchView(),
        ),
      ),
    ],
  );
}
