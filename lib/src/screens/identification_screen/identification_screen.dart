import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jewellery_app/src/common/ext/context_ext.dart';
import 'package:jewellery_app/src/common/service/local_dara_service.dart';
import 'package:jewellery_app/src/common/utils/utils.dart';
import 'package:jewellery_app/src/screens/mixin/connectivity_mixin.dart';
import '../../common/constants/app_router.dart';
import '../../common/constants/strings.dart';
import '../../common/constants/text_style.dart';
import '../bloc/connectivity/connectivity_bloc.dart';
import 'view/registration_button.dart';
import 'view/text_field_widget_registration.dart';

part './mixin/identification_mixin.dart';

class IdentificationScreen extends StatefulWidget {
  const IdentificationScreen({super.key});

  @override
  State<IdentificationScreen> createState() => _IdentificationScreenState();
}

class _IdentificationScreenState extends State<IdentificationScreen>
    with IdentificationMixin, ConnectivityMixin {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityBloc, bool>(
      listener: checkerListener,
      child: Scaffold(
        backgroundColor: const Color(0xFF000000),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.92,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox.shrink(),

                              /// Skip Button
                              TextButton(
                                onPressed: () {
                                  context.pushReplacementNamed(Routes.main);
                                },
                                child: Text(
                                  context.l10n.skip,
                                  style: Styles.w400,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),

                          /// Text
                          Text(
                            context.l10n.registration,
                            style: Styles.w700_30,
                          ),
                          const Spacer(),

                          /// Text
                           Text(
                           context.l10n.after,
                            style: Styles.w400_15,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const Spacer(),

                            /// User Name
                            TextFieldRegistrationWidgets(
                              controller: controllerName,
                              validator: validateName,
                              textInputAction: TextInputAction.next,
                              hintText: context.l10n.name,
                            ),
                            const Spacer(),

                            /// User Number
                            TextFieldRegistrationWidgets(
                              controller: controllerPhone,
                              validator: validatePhone,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.phone,
                              hintText: context.l10n.phone,
                            ),
                            const Spacer(flex: 8),
                            RegistrationButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await LocalDataService.setUser(
                                    controllerName.text.trim(),
                                    controllerPhone.text.trim(),
                                  );
                                  if (context.mounted) {
                                    AppUtils.msg(
                                      context,
                                      context.l10n.successful,
                                    );
                                    AppUtils.msg(
                                      context,
                                      context.l10n.product,
                                    );

                                    context.pop();
                                  }
                                }
                              },
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
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
