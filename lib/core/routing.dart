import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pid/features/departures/presentation/screens/departures_list_screen.dart';
import 'package:pid/features/map/presentation/screens/vehicle_location_screen.dart';
import 'package:pid/features/stops/presentation/screens/stops_list_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const StopsListScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: DeparturesListScreen.routePath,
          name: DeparturesListScreen.routeName,
          builder: (BuildContext context, GoRouterState state) {
            return DeparturesListScreen(
              stopId:
                  state.uri.queryParameters[DeparturesListScreen.stopIdKey]!,
            );
          },
          routes: [
            GoRoute(
              path: VehicleLocationScreen.routePath,
              name: VehicleLocationScreen.routeName,
              builder: (BuildContext context, GoRouterState state) {
                return VehicleLocationScreen(
                  vehicleId: state
                      .uri.queryParameters[VehicleLocationScreen.vehicleIdKey]!,
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
