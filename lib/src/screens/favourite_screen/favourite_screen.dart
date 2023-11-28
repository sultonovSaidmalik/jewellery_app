import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jewellery_app/src/common/ext/context_ext.dart';
import 'package:jewellery_app/src/common/utils/utils.dart';
import 'package:jewellery_app/src/screens/bloc/connectivity/connectivity_bloc.dart';
import 'package:jewellery_app/src/screens/bloc/connectivity/connectivity_bloc.dart';
import 'package:jewellery_app/src/screens/mixin/connectivity_mixin.dart';
import 'bloc/favorite_bloc.dart';
import 'view/app_bar_text.dart';
import 'view/favourite_widgets_list_view.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen>
    with ConnectivityMixin {
  @override
  void didChangeDependencies() {
    context.read<FavoriteBloc>().add(const FavoriteGetDataEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityBloc, bool>(
      listener: checkerListener,
      child: BlocListener<FavoriteBloc, FavoriteState>(
        listener: (context, state) {
          if (state.status == FavoriteStatus.successDelete) {
            AppUtils.msg(context, context.l10n.removed,);
            context.read<FavoriteBloc>().add(const FavoriteGetDataEvent());
          }
        },
        child: const Scaffold(
          backgroundColor: Color(0xFF000000),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// appBar Text
                  AppBarTextWidgets(),
                  SizedBox(height: 15),

                  /// Favourite Product Widget
                  FavouriteProductWidgets(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
