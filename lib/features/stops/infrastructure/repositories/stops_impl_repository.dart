import 'dart:async';

import 'package:pid/features/stops/infrastructure/dto/stops_dto.dart';

import '../../../../core/models/result.dart';
import '../../domain/repositories/stops_repository.dart';
import '../apis/stops_api.dart';

class StopsImplRepository implements IStopsRepository {
  StopsImplRepository({
    required this.stopsApi,
  });

  final StopsApi stopsApi;

  @override
  Future<Result<StopsDto>> getStopsList() async {
    try {
      var response = await stopsApi.getStops();
      return Success(StopsDto.fromJson(response.data));
    } catch (e) {
      return Failure();
    }
  }
}
