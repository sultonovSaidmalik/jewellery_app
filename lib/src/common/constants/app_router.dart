import 'package:go_router/go_router.dart';
import 'package:jewellery_app/src/common/models/product_model.dart';
import 'package:jewellery_app/src/screens/main_screen/main_screen.dart';
import 'package:jewellery_app/src/screens/sign_in/sign_in.dart';
import 'package:jewellery_app/src/screens/sign_up/sign_up.dart';
import '../../screens/detail_screen/detail_screen.dart';

class AppRouter {
  const AppRouter._();

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.main,
        name: Routes.main,
        builder: (context, state) {
          return const MainScreen();
        },
        // redirect: (context, state) => Routes.signIn,
        routes: [
          GoRoute(
            path: 'view',
            builder: (context, state) {
              if (state.extra is! Product) {
                throw GoException("Detail Screen Product Not Found");
              }
              final product = state.extra as Product;
              return DetailScreen(
                product: product,
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: Routes.signIn,
        name: Routes.signIn,
        builder: (context, state) {
          return const SignInScreen();
        },
      ),
      GoRoute(
        path: Routes.signUp,
        name: Routes.signUp,
        builder: (context, state) {
          return const SignUpScree();
        },
      ),
    ],
  );
}

class Routes {
  const Routes._();

  static const String main = "/";
  static const String signIn = "/sign_in";
  static const String signUp = "/sign_up";
}
