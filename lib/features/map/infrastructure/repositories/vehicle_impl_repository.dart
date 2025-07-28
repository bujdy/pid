import 'dart:async';

import '../../../../core/models/result.dart';
import '../../domain/repositories/vehicle_repository.dart';
import '../apis/map_api.dart';
import '../dto/vehicle_location_dto.dart';

class VehicleImplRepository implements IVehicleRepository {
  VehicleImplRepository({
    required this.mapApi,
  });

  final MapApi mapApi;

  @override
  Future<Result<VehicleLocationDto>> getVehicleLocation(
      {required String vehicleId}) async {
    try {
      var response =
          await mapApi.getVehicleLocation(vehicleId: vehicleId, scopes: 'info');
      return Success(VehicleLocationDto.fromJson(response.data));
    } catch (e) {
      return Failure();
    }
  }
}
