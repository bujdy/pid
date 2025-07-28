import '../../../../core/models/result.dart';
import '../../infrastructure/dto/stops_dto.dart';

abstract interface class IStopsRepository {
  Future<Result<StopsDto>> getStopsList();
}
