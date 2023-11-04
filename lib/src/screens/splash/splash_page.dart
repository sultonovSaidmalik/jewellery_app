import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jewellery_app/src/common/service/local_dara_service.dart';

import '../../common/constants/app_router.dart';
import 'bloc/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(const SplashEvent());
  }

  @override
  Widget build(BuildContext context) => BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.isTimerFinished) {
            if (LocalDataService.isSaveLocale) {
              context.pushReplacementNamed(Routes.main);
            } else {
              context.pushReplacementNamed(Routes.chooseLang);
            }
          }
        },
        child: const AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                Center(
                  child: Image(image: AssetImage("assets/icons/ic_app_icons.jpg")),
                ),
                Positioned(
                  bottom: 80,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                      strokeAlign: -10,
                      color: Color(0xFF9AA6AC),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
