import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jewellery_app/src/common/constants/app_router.dart';
import 'package:jewellery_app/src/common/constants/strings.dart';
import 'package:jewellery_app/src/common/ext/context_ext.dart';
import 'package:jewellery_app/src/common/service/local_dara_service.dart';
import 'package:jewellery_app/src/common/utils/utils.dart';
import 'package:jewellery_app/src/screens/bloc/connectivity/connectivity_bloc.dart';
import 'package:jewellery_app/src/screens/bloc/connectivity/connectivity_bloc.dart';
import 'package:jewellery_app/src/screens/card_screen/bloc/cart_bloc.dart';
import 'package:jewellery_app/src/screens/card_screen/scop/cart_scope.dart';
import 'package:jewellery_app/src/screens/mixin/connectivity_mixin.dart';
import 'view/bottom_total_price_button.dart';
import 'view/list_view_cart_product.dart';
import 'view/screen_name_and_cart_button.dart';

part './mixin/cart_mixin.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with CartMixin, ConnectivityMixin {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityBloc, bool>(
      listener: checkerListener,
      child: BlocListener<CartBloc, CartState>(
        listener: (BuildContext context, CartState state) {
          if (state.status == CartStatus.clearCartEmpty) {
            AppUtils.msgWarning(context, context.l10n.cartIsEmpty,);
          }
          if (state.status == CartStatus.clearCart) {
            AppUtils.msg(context, context.l10n.cartRemoved);
          }
          if (state.status == CartStatus.orderError) {
            AppUtils.msgWarning(context, "Iltimos internetingizni tekshiring!");
          }
          if (state.status == CartStatus.ordered) {
            AppUtils.msg(context,
                context.l10n.successOrder,);
          }
        },
        child: CartScope(
          onPressOrder: orderPress,
          child: const Scaffold(
            backgroundColor: Color(0xFF000000),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Column(
                  children: [

                    /// Screen name and Clear Cart Button
                    ScreenNameAndCartButton(),
                    SizedBox(height: 20),

                    /// ListView Cart Product
                    ListViewCartProduct(),

                    /// bottom Total price Button
                    BottomTotalPrice(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
