import 'package:go_router/go_router.dart';
import 'package:jewellery_app/src/common/models/product_model.dart';
import 'package:jewellery_app/src/screens/choose_lang/choose_lang_screen.dart';
import 'package:jewellery_app/src/screens/main_screen/main_screen.dart';
import '../../screens/auth/sign_in/sign_in.dart';
import '../../screens/auth/sign_up/sign_up.dart';
import '../../screens/detail_screen/detail_screen.dart';
import '../../screens/identification_screen/identification_screen.dart';
import '../../screens/splash/splash_page.dart';

class AppRouter {
  const AppRouter._();

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.splash,
        name: Routes.splash,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: Routes.main,
        name: Routes.main,
        builder: (context, state) {
          return const MainScreen();
        },
        routes: [
          GoRoute(
            path: Routes.view,
            name: Routes.view,
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
          GoRoute(
            path: Routes.identification,
            name: Routes.identification,
            builder: (context, state) {
              return const IdentificationScreen();
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
      GoRoute(
        path: Routes.chooseLang,
        name: Routes.chooseLang,
        builder: (context, state) {
          return const ChooseLang();
        },
      ),
    ],
  );
}

class Routes {
  const Routes._();

  static const String splash = "/";
  static const String main = "/main";
  static const String identification = "main/identification";
  static const String view = "view";
  static const String signIn = "/sign_in";
  static const String signUp = "/sign_up";
  static const String chooseLang = "/choose_lang";
}
