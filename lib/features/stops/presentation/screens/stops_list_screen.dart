import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pid/core/extensions/build_context_extension.dart';
import 'package:pid/core/injection.dart';
import 'package:pid/core/widgets/app_scaffold.dart';
import 'package:pid/features/stops/application/stops_list_bloc.dart';

import '../widgets/stops_list_body.dart';

class StopsListScreen extends StatelessWidget {
  const StopsListScreen({super.key});

  static const String routeName = 'StopsListScreen';
  static const String routePath = 'stops_list_screen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StopsListBloc>(
      create: (_) => getIt<StopsListBloc>()
        ..add(
          StopsListRequested(),
        ),
      child: AppScaffold(
        title: context.tr.stops_list_title,
        body: StopsListBody(),
      ),
    );
  }
}
