import 'package:flutter/material.dart';
import 'package:pid/core/theme/app_colors.dart';

class AppScaffold extends Scaffold {
  final String? title;

  AppScaffold({
    super.key,
    super.body,
    this.title,
  }) : super(
          backgroundColor:
              title == null ? Colors.transparent : AppColors.background,
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            backgroundColor:
                title == null ? Colors.transparent : AppColors.background,
            title: title == null ? null : Text(title),
            centerTitle: false,
          ),
          extendBodyBehindAppBar: title == null,
        );
}
