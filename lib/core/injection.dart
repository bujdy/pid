import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pid/features/departures/domain/repositories/departures_repository.dart';
import 'package:pid/features/map/application/vehicle_location_bloc.dart';
import 'package:pid/features/map/infrastructure/apis/map_api.dart';

import '../features/departures/application/departures_list_bloc.dart';
import '../features/departures/infrastructure/apis/departures_api.dart';
import '../features/departures/infrastructure/repositories/departures_impl_repository.dart';
import '../features/map/domain/repositories/vehicle_repository.dart';
import '../features/map/infrastructure/repositories/vehicle_impl_repository.dart';
import '../features/stops/application/stops_list_bloc.dart';
import '../features/stops/domain/repositories/stops_repository.dart';
import '../features/stops/infrastructure/apis/stops_api.dart';
import '../features/stops/infrastructure/repositories/stops_impl_repository.dart';
import 'network/dio_interceptors.dart';

late final GetIt getIt;

Future<void> injection(WidgetsBinding binding) async {
  getIt = GetIt.instance;

  getIt.registerLazySingleton<Dio>(() {
    var dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.golemio.cz',
      ),
    );
    dio.interceptors.add(DioAccessTokenInterceptor());

    return dio;
  });

  getIt.registerLazySingleton<DeparturesApi>(
    () => DeparturesApi(getIt()),
  );

  getIt.registerLazySingleton<IDeparturesRepository>(
    () => DeparturesImplRepository(departuresApi: getIt()),
  );

  getIt.registerFactory<DeparturesListBloc>(
    () => DeparturesListBloc(departuresRepository: getIt()),
  );

  getIt.registerLazySingleton<StopsApi>(
    () => StopsApi(getIt()),
  );

  getIt.registerLazySingleton<IStopsRepository>(
    () => StopsImplRepository(stopsApi: getIt()),
  );

  getIt.registerFactory<StopsListBloc>(
    () => StopsListBloc(stopsRepository: getIt()),
  );

  getIt.registerLazySingleton<MapApi>(
    () => MapApi(getIt()),
  );

  getIt.registerLazySingleton<IVehicleRepository>(
    () => VehicleImplRepository(mapApi: getIt()),
  );

  getIt.registerFactory<VehicleLocationBloc>(
    () => VehicleLocationBloc(vehicleRepository: getIt()),
  );
}

@visibleForTesting
void injectionWidgetTest(GetIt instance) {
  getIt = instance;
}
