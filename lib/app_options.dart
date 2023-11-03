import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_app/src/common/service/local_dara_service.dart';

class AppOptions extends Equatable {
  const AppOptions({
    required this.locale,
  });

  static AppOptions get instance =>  AppOptions(locale: LocalDataService.getLocale);


  final Locale locale;

  AppOptions copyWith({
    Locale? locale,
  }) =>
      AppOptions(
        locale: locale ?? this.locale,
      );

  static AppOptions of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>()!;
    return scope.modelBindingState.currentModel;
  }

  static void update(BuildContext context, AppOptions newModel) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>()!;
    scope.modelBindingState.updateModel(newModel);
  }

  @override
  List<Object> get props => [locale];
}

class _ModelBindingScope extends InheritedWidget {
  const _ModelBindingScope({
    required this.modelBindingState,
    required super.child,
  });

  final _ModelBindingState modelBindingState;

  @override
  bool updateShouldNotify(_ModelBindingScope oldWidget) => true;
}

class ModelBinding extends StatefulWidget {
  const ModelBinding({
    super.key,
    required this.initialModel,
    required this.child,
  });

  final AppOptions initialModel;
  final Widget child;

  @override
  State<ModelBinding> createState() => _ModelBindingState();
}

class _ModelBindingState extends State<ModelBinding> {
  late AppOptions currentModel;

  @override
  void initState() {
    super.initState();
    currentModel = widget.initialModel;
  }

  void updateModel(AppOptions newModel) async{
    if (newModel != currentModel) {
      await LocalDataService.setLocale(newModel.locale);
      setState(() {
        currentModel = newModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) => _ModelBindingScope(
        modelBindingState: this,
        child: widget.child,
      );
}
