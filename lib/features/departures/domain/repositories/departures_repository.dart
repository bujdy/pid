import 'package:pid/features/departures/infrastructure/dto/departures_dto.dart';

import '../../../../core/models/result.dart';

abstract interface class IDeparturesRepository {
  Future<Result<List<DepartureBoardDto>>> getDepartureBoards(
      List<String> stopIds);
}
