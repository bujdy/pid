import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'stops_api.g.dart';

@RestApi()
abstract class StopsApi {
  factory StopsApi(Dio dio) = _StopsApi;

  @GET('/v2/gtfs/stops')
  Future<HttpResponse> getStops();
}
