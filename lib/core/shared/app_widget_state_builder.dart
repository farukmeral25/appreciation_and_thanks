import 'package:appreciation_and_thanks/core/shared/app_text.dart';
import 'package:appreciation_and_thanks/core/utils/ui_state.dart';
import 'package:flutter/material.dart';

class AppWidgetBuilderByState<T> extends StatelessWidget {
  const AppWidgetBuilderByState({
    Key? key,
    required this.response,
    required this.builder,
    this.idleWidget,
    this.loadingWidget,
    this.errorWidget,
  }) : super(key: key);
  final UIState<T> response;
  final Function(T) builder;
  final Widget? idleWidget;
  final Widget? loadingWidget;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    switch (response.status) {
      case UIStateStatus.idle:
        return idleWidget ?? const SizedBox.shrink();
      case UIStateStatus.loading:
        return loadingWidget ?? const CircularProgressIndicator.adaptive();
      case UIStateStatus.success:
        return builder(response.data as T);
      case UIStateStatus.error:
        return errorWidget ?? AppText.bodyMedium(response.message);
    }
  }
}
