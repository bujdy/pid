import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'departures_api.g.dart';

@RestApi()
abstract class DeparturesApi {
  factory DeparturesApi(Dio dio) = _DeparturesApi;

  @GET('/v2/public/departureboards')
  Future<HttpResponse> getDepartures({
    @Query("stopIds") required List<String> stopIds,
  });
}
