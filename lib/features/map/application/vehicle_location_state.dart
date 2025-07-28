part of 'vehicle_location_bloc.dart';

sealed class VehicleLocationState extends Equatable {
  const VehicleLocationState();

  @override
  List<Object?> get props => [];
}

final class VehicleLocationStateIdle extends VehicleLocationState {
  const VehicleLocationStateIdle();
}

final class VehicleLocationStateLoading extends VehicleLocationState {
  const VehicleLocationStateLoading({required this.vehicleLocation});

  final VehicleLocationDto? vehicleLocation;

  @override
  List<Object?> get props => [vehicleLocation];
}

final class VehicleLocationStateSuccess extends VehicleLocationStateLoading {
  const VehicleLocationStateSuccess({required super.vehicleLocation});

  @override
  List<Object?> get props => [...super.props];
}

final class VehicleLocationStateFailure extends VehicleLocationState {
  const VehicleLocationStateFailure();
}

extension VehicleLocationStateX on VehicleLocationState {
  LatLng? get currentLatLng {
    var currentState = this;
    return currentState is VehicleLocationStateLoading
        ? currentState.vehicleLocation?.geometry?.latLng
        : null;
  }
}
