part of 'vehicle_location_bloc.dart';

sealed class VehicleLocationEvent extends Equatable {
  const VehicleLocationEvent();

  @override
  List<Object?> get props => [];
}

final class VehicleLocationPeriodicRequested extends VehicleLocationEvent {
  const VehicleLocationPeriodicRequested({required this.vehicleId});

  final String vehicleId;

  @override
  List<Object?> get props => [vehicleId];
}

final class VehicleLocationRequested extends VehicleLocationEvent {
  const VehicleLocationRequested({required this.vehicleId});

  final String vehicleId;

  @override
  List<Object?> get props => [vehicleId];
}
