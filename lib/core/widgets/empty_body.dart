import 'package:flutter/material.dart';
import 'package:pid/core/extensions/build_context_extension.dart';

class EmptyBody extends StatelessWidget {
  const EmptyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.tr.empty_list),
    );
  }
}
