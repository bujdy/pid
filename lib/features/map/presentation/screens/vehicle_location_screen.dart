import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pid/core/widgets/app_scaffold.dart';
import 'package:pid/features/map/application/vehicle_location_bloc.dart';

import '../../../../core/injection.dart';
import '../widgets/vehicle_location_body.dart';

class VehicleLocationScreen extends StatelessWidget {
  const VehicleLocationScreen({super.key, required this.vehicleId});

  final String vehicleId;

  static const String routeName = 'VehicleLocationScreen';
  static const String routePath = '/map_current_location_screen';

  static String vehicleIdKey = 'vehicleId';

  static void push(BuildContext context, {required String vehicleId}) {
    context.pushNamed(VehicleLocationScreen.routeName, queryParameters: {
      vehicleIdKey: vehicleId,
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VehicleLocationBloc>(
      create: (_) => getIt<VehicleLocationBloc>()
        ..add(VehicleLocationPeriodicRequested(vehicleId: vehicleId)),
      child: AppScaffold(
        body: VehicleLocationBody(),
      ),
    );
  }
}
