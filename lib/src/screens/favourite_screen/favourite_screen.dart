import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jewellery_app/src/common/utils/utils.dart';
import 'bloc/favorite_bloc.dart';
import 'view/app_bar_text.dart';
import 'view/favourite_widgets_list_view.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteBloc, FavoriteState>(
      listener: (context, state) {
        if (state.status == FavoriteStatus.successDelete) {
          AppUtils.msg(context, "Favoritedan o'chirildi !");
          context.read<FavoriteBloc>().add(const FavoriteGetDataEvent());
        }
      },
      child: const Scaffold(
        backgroundColor: Color(0xFF000000),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
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
    );
  }
}
