import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class FailureBody extends StatelessWidget {
  const FailureBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.error,
        color: AppColors.error,
      ),
    );
  }
}
