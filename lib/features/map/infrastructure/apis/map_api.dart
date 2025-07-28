import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'map_api.g.dart';

@RestApi()
abstract class MapApi {
  factory MapApi(Dio dio) = _MapApi;

  @GET('/v2/public/vehiclepositions/{vehicleId}')
  Future<HttpResponse> getVehicleLocation({
    @Path('vehicleId') required String vehicleId,
    @Query("scopes") required String scopes,
  });
}
