import 'dart:async';
import 'dart:convert';

import 'package:pid/features/departures/infrastructure/apis/departures_api.dart';

import '../../../../core/models/result.dart';
import '../../domain/repositories/departures_repository.dart';
import '../dto/departures_dto.dart';

class DeparturesImplRepository implements IDeparturesRepository {
  DeparturesImplRepository({
    required this.departuresApi,
  });

  final DeparturesApi departuresApi;

  @override
  Future<Result<List<DepartureBoardDto>>> getDepartureBoards(
      List<String> stopIds) async {
    try {
      var response = await departuresApi.getDepartures(
          stopIds: stopIds
              .asMap()
              .entries
              .map(
                (e) => jsonEncode({
                  e.key.toString(): [e.value],
                }),
              )
              .toList());

      final flatList = (response.data as List<dynamic>)
          .expand((innerList) => (innerList as List<dynamic>))
          .toList();

      final parsed = flatList
          .map((jsonItem) =>
              DepartureBoardDto.fromJson(jsonItem as Map<String, dynamic>))
          .toList();

      return Success(parsed);
    } catch (e) {
      return Failure();
    }
  }
}
