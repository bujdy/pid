import '../../../../core/models/result.dart';
import '../../infrastructure/dto/vehicle_location_dto.dart';

abstract interface class IVehicleRepository {
  Future<Result<VehicleLocationDto>> getVehicleLocation(
      {required String vehicleId});
}
