import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jewellery_app/app_options.dart';
import 'package:jewellery_app/src/common/constants/app_router.dart';
import 'package:jewellery_app/src/common/l10n/app_localizations.dart';
import 'package:jewellery_app/src/screens/auth/bloc/auth_bloc.dart';
import 'package:jewellery_app/src/screens/favourite_screen/bloc/favorite_bloc.dart';
import 'package:jewellery_app/src/screens/main_screen/bloc/main_bloc.dart';
import 'package:jewellery_app/src/screens/mixin/connectivity_mixin.dart';
import 'package:jewellery_app/src/screens/splash/bloc/splash_bloc.dart';
import 'src/common/service/service_locator.dart';
import 'src/repository/card_repository/cart_repository.dart';
import 'src/repository/product_repository/product_repository.dart';
import 'src/screens/bloc/connectivity/connectivity_bloc.dart';
import 'src/screens/card_screen/bloc/cart_bloc.dart';
import 'src/screens/home_screen/bloc/home_bloc.dart';

class JewelleryApp extends StatelessWidget with ConnectivityMixin {
  const JewelleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainBloc>(create: (context) => MainBloc()),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<SplashBloc>(create: (context) => SplashBloc()),
        BlocProvider<ConnectivityBloc>(create: (context) => ConnectivityBloc()),
        BlocProvider(create: (context) {
          final cart = sl<CartRepository>().getCard();
          return CartBloc(cart);
        }),
        BlocProvider(
          create: (context) =>
              FavoriteBloc()..add(const FavoriteGetDataEvent()),
        ),
        BlocProvider(
          create: (context) => HomeBloc(
            repository: sl<ProductRepository>(),
          )..add(const HomeGetAllDataEvent()),
        ),
      ],
      child: ModelBinding(
        initialModel: AppOptions.instance,
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(useMaterial3: true),
              darkTheme: ThemeData.dark(useMaterial3: true),
              themeMode: ThemeMode.dark,
              locale: AppOptions.of(context).locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,

              routerConfig: AppRouter.router,
            );
          }
        ),
      ),
    );
  }
}
