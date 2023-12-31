import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jewellery_app/src/common/constants/app_router.dart';
import 'package:jewellery_app/src/common/constants/strings.dart';
import 'package:jewellery_app/src/common/ext/context_ext.dart';
import 'package:jewellery_app/src/common/service/local_dara_service.dart';
import 'package:jewellery_app/src/screens/card_screen/card_screen.dart';
import 'package:jewellery_app/src/screens/favourite_screen/favourite_screen.dart';
import 'package:jewellery_app/src/screens/home_screen/home_screen.dart';
import 'package:jewellery_app/src/screens/mixin/connectivity_mixin.dart';
import '../../common/utils/utils.dart';
import '../bloc/connectivity/connectivity_bloc.dart';
import 'view/drawer_not_user_widget.dart';
import 'view/drawer_user_widget.dart';
import 'bloc/main_bloc.dart';
import 'view/custom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with ConnectivityMixin {
  ZoomDrawerController drawerController = ZoomDrawerController();
  final PageController screenController = PageController(initialPage: 1);

  bool isUser = true;

  @override
  void didChangeDependencies() async {
    if (!(await InternetConnectionChecker().hasConnection)) {
      return AppUtils.msgWarning(context, context.l10n.connect);
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityBloc, bool>(
      listener: checkerListener,
      child: ZoomDrawer(
        controller: drawerController,
        slideWidth: 300,
        isRtl: true,
        angle: 0.0,
        mainScreen: MainScope(
          drawerController: drawerController,
          child: Scaffold(
            /// body
            body: PageView(
              controller: screenController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                FavouriteScreen(),
                HomeScreen(),
                CartScreen(),
              ],
            ),

            /// bottom
            bottomNavigationBar: BlocConsumer<MainBloc, MainState>(
              builder: (context, state) {
                return CustomBottomNavigationBar(
                  index: state.index,
                  changePage: (int index) {
                    context.read<MainBloc>().add(MainChangeEvent(index: index));
                  },
                );
              },
              listener: (BuildContext context, MainState state) {
                screenController.jumpToPage(state.index);
              },
            ),
          ),
        ),
        menuScreen: ValueListenableBuilder(
          valueListenable: LocalDataService.isUserListenable,
          builder: (BuildContext context, value, Widget? child) {
            return (value.get("isUser", defaultValue: false)
                ? const DrawerUserWidget()
                : const DrawerNotUserWidget());
          },
        ),
      ),
    );
  }
}

class MainScope extends InheritedWidget {
  final ZoomDrawerController drawerController;

  const MainScope(
      {required this.drawerController, super.key, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
