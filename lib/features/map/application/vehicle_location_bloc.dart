import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:pid/core/models/result.dart';

import '../domain/repositories/vehicle_repository.dart';
import '../infrastructure/dto/vehicle_location_dto.dart';

part 'vehicle_location_event.dart';
part 'vehicle_location_state.dart';

class VehicleLocationBloc
    extends Bloc<VehicleLocationEvent, VehicleLocationState> {
  VehicleLocationBloc({required this.vehicleRepository})
      : super(const VehicleLocationStateIdle()) {
    on<VehicleLocationRequested>(_onVehicleLocationRequested);
    on<VehicleLocationPeriodicRequested>(_onVehicleLocationPeriodicRequested);
  }

  Timer? _timer;
  final IVehicleRepository vehicleRepository;

  void _onVehicleLocationPeriodicRequested(
      VehicleLocationPeriodicRequested event, Emitter emit) {
    add(VehicleLocationRequested(vehicleId: event.vehicleId));

    _timer = Timer.periodic(Duration(seconds: 10), (_) {
      add(VehicleLocationRequested(vehicleId: event.vehicleId));
    });
  }

  Future<void> _onVehicleLocationRequested(
    VehicleLocationRequested event,
    Emitter<VehicleLocationState> emit,
  ) async {
    var currentState = state;
    // Preventing the marker from disappearing for a few seconds
    emit(
      VehicleLocationStateLoading(
        vehicleLocation: currentState is VehicleLocationStateSuccess
            ? currentState.vehicleLocation
            : null,
      ),
    );
    var result =
        await vehicleRepository.getVehicleLocation(vehicleId: event.vehicleId);
    await result.when(success: (data) async {
      emit(VehicleLocationStateSuccess(vehicleLocation: data));
    }, failure: (error) {
      emit(const VehicleLocationStateFailure());
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
