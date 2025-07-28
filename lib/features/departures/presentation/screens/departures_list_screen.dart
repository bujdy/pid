import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pid/core/extensions/build_context_extension.dart';
import 'package:pid/core/widgets/app_scaffold.dart';

import '../../../../core/injection.dart';
import '../../application/departures_list_bloc.dart';
import '../widgets/departures_list_body.dart';

class DeparturesListScreen extends StatelessWidget {
  const DeparturesListScreen({super.key, required this.stopId});

  final String stopId;

  static const String routeName = 'DeparturesListScreen';
  static const String routePath = '/departures_list_screen';

  static String stopIdKey = 'stopId';

  static void push(BuildContext context, {required String stopId}) {
    context.pushNamed(DeparturesListScreen.routeName, queryParameters: {
      stopIdKey: stopId,
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeparturesListBloc>(
      create: (_) => getIt<DeparturesListBloc>()
        ..add(
          DeparturesListRequested(stopId: stopId),
        ),
      child: AppScaffold(
        title: context.tr.departures_list_title,
        body: DeparturesListBody(),
      ),
    );
  }
}
