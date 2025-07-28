import 'package:latlong2/latlong.dart';

class VehicleLocationDto {
  final String? gtfsTripId;
  final String? routeType;
  final String? routeShortName;
  final String? shapeId;
  final String? originRouteName;
  final int? runNumber;
  final String? tripHeadsign;
  final GeometryDto? geometry;
  final double? shapeDistTraveled;
  final int? bearing;
  final int? delay;
  final String? statePosition;
  final int? lastStopSequence;
  final DateTime? originTimestamp;
  final StopTimesDto? stopTimes;
  final ShapesDto? shapes;
  final VehicleDescriptorDto? vehicleDescriptor;

  VehicleLocationDto({
    this.gtfsTripId,
    this.routeType,
    this.routeShortName,
    this.shapeId,
    this.originRouteName,
    this.runNumber,
    this.tripHeadsign,
    this.geometry,
    this.shapeDistTraveled,
    this.bearing,
    this.delay,
    this.statePosition,
    this.lastStopSequence,
    this.originTimestamp,
    this.stopTimes,
    this.shapes,
    this.vehicleDescriptor,
  });

  factory VehicleLocationDto.fromJson(Map<String, dynamic> json) {
    return VehicleLocationDto(
      gtfsTripId: json['gtfs_trip_id'] as String?,
      routeType: json['route_type'] as String?,
      routeShortName: json['route_short_name'] as String?,
      shapeId: json['shape_id'] as String?,
      originRouteName: json['origin_route_name'] as String?,
      runNumber: json['run_number'] as int?,
      tripHeadsign: json['trip_headsign'] as String?,
      geometry: json['geometry'] != null
          ? GeometryDto.fromJson(json['geometry'])
          : null,
      shapeDistTraveled: (json['shape_dist_traveled'] as num?)?.toDouble(),
      bearing: json['bearing'] as int?,
      delay: json['delay'] as int?,
      statePosition: json['state_position'] as String?,
      lastStopSequence: json['last_stop_sequence'] as int?,
      originTimestamp: json['origin_timestamp'] != null
          ? DateTime.parse(json['origin_timestamp'])
          : null,
      stopTimes: json['stop_times'] != null
          ? StopTimesDto.fromJson(json['stop_times'])
          : null,
      shapes:
          json['shapes'] != null ? ShapesDto.fromJson(json['shapes']) : null,
      vehicleDescriptor: json['vehicle_descriptor'] != null
          ? VehicleDescriptorDto.fromJson(json['vehicle_descriptor'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'gtfs_trip_id': gtfsTripId,
        'route_type': routeType,
        'route_short_name': routeShortName,
        'shape_id': shapeId,
        'origin_route_name': originRouteName,
        'run_number': runNumber,
        'trip_headsign': tripHeadsign,
        'geometry': geometry?.toJson(),
        'shape_dist_traveled': shapeDistTraveled,
        'bearing': bearing,
        'delay': delay,
        'state_position': statePosition,
        'last_stop_sequence': lastStopSequence,
        'origin_timestamp': originTimestamp?.toIso8601String(),
        'stop_times': stopTimes?.toJson(),
        'shapes': shapes?.toJson(),
        'vehicle_descriptor': vehicleDescriptor?.toJson(),
      };
}

class GeometryDto {
  final List<double>? coordinates;
  final String? type;

  GeometryDto({this.coordinates, this.type});

  factory GeometryDto.fromJson(Map<String, dynamic> json) => GeometryDto(
        coordinates: (json['coordinates'] as List<dynamic>?)
            ?.map((e) => (e as num).toDouble())
            .toList(),
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'coordinates': coordinates,
        'type': type,
      };

  LatLng? get latLng {
    if (coordinates == null || coordinates!.length < 2) return null;
    return LatLng(coordinates![1], coordinates![0]);
  }
}

class ShapesDto {
  final List<ShapesFeatureDto>? features;
  final String? type;

  ShapesDto({this.features, this.type});

  factory ShapesDto.fromJson(Map<String, dynamic> json) => ShapesDto(
        features: (json['features'] as List<dynamic>?)
            ?.map((e) => ShapesFeatureDto.fromJson(e))
            .toList(),
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'features': features?.map((e) => e.toJson()).toList(),
        'type': type,
      };
}

class ShapesFeatureDto {
  final GeometryDto? geometry;
  final PurplePropertiesDto? properties;
  final String? type;

  ShapesFeatureDto({this.geometry, this.properties, this.type});

  factory ShapesFeatureDto.fromJson(Map<String, dynamic> json) =>
      ShapesFeatureDto(
        geometry: json['geometry'] != null
            ? GeometryDto.fromJson(json['geometry'])
            : null,
        properties: json['properties'] != null
            ? PurplePropertiesDto.fromJson(json['properties'])
            : null,
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'geometry': geometry?.toJson(),
        'properties': properties?.toJson(),
        'type': type,
      };
}

class PurplePropertiesDto {
  final int? shapeDistTraveled;

  PurplePropertiesDto({this.shapeDistTraveled});

  factory PurplePropertiesDto.fromJson(Map<String, dynamic> json) =>
      PurplePropertiesDto(
        shapeDistTraveled: json['shape_dist_traveled'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'shape_dist_traveled': shapeDistTraveled,
      };
}

class StopTimesDto {
  final List<StopTimesFeatureDto>? features;
  final String? type;

  StopTimesDto({this.features, this.type});

  factory StopTimesDto.fromJson(Map<String, dynamic> json) => StopTimesDto(
        features: (json['features'] as List<dynamic>?)
            ?.map((e) => StopTimesFeatureDto.fromJson(e))
            .toList(),
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'features': features?.map((e) => e.toJson()).toList(),
        'type': type,
      };
}

class StopTimesFeatureDto {
  final GeometryDto? geometry;
  final FluffyPropertiesDto? properties;
  final String? type;

  StopTimesFeatureDto({this.geometry, this.properties, this.type});

  factory StopTimesFeatureDto.fromJson(Map<String, dynamic> json) =>
      StopTimesFeatureDto(
        geometry: json['geometry'] != null
            ? GeometryDto.fromJson(json['geometry'])
            : null,
        properties: json['properties'] != null
            ? FluffyPropertiesDto.fromJson(json['properties'])
            : null,
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'geometry': geometry?.toJson(),
        'properties': properties?.toJson(),
        'type': type,
      };
}

class FluffyPropertiesDto {
  final String? stopName;
  final int? stopSequence;
  final String? zoneId;
  final bool? isWheelchairAccessible;
  final int? shapeDistTraveled;
  final String? arrivalTime;
  final String? departureTime;
  final String? realtimeArrivalTime;
  final String? realtimeDepartureTime;

  FluffyPropertiesDto({
    this.stopName,
    this.stopSequence,
    this.zoneId,
    this.isWheelchairAccessible,
    this.shapeDistTraveled,
    this.arrivalTime,
    this.departureTime,
    this.realtimeArrivalTime,
    this.realtimeDepartureTime,
  });

  factory FluffyPropertiesDto.fromJson(Map<String, dynamic> json) =>
      FluffyPropertiesDto(
        stopName: json['stop_name'] as String?,
        stopSequence: json['stop_sequence'] as int?,
        zoneId: json['zone_id'] as String?,
        isWheelchairAccessible: json['is_wheelchair_accessible'] as bool?,
        shapeDistTraveled: json['shape_dist_traveled'] as int?,
        arrivalTime: json['arrival_time'] as String?,
        departureTime: json['departure_time'] as String?,
        realtimeArrivalTime: json['realtime_arrival_time'] as String?,
        realtimeDepartureTime: json['realtime_departure_time'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'stop_name': stopName,
        'stop_sequence': stopSequence,
        'zone_id': zoneId,
        'is_wheelchair_accessible': isWheelchairAccessible,
        'shape_dist_traveled': shapeDistTraveled,
        'arrival_time': arrivalTime,
        'departure_time': departureTime,
        'realtime_arrival_time': realtimeArrivalTime,
        'realtime_departure_time': realtimeDepartureTime,
      };
}

class VehicleDescriptorDto {
  final String? vehicleDescriptorOperator;
  final String? vehicleType;
  final bool? isWheelchairAccessible;
  final bool? isAirConditioned;
  final bool? hasUsbChargers;
  final String? vehicleRegistrationNumber;

  VehicleDescriptorDto({
    this.vehicleDescriptorOperator,
    this.vehicleType,
    this.isWheelchairAccessible,
    this.isAirConditioned,
    this.hasUsbChargers,
    this.vehicleRegistrationNumber,
  });

  factory VehicleDescriptorDto.fromJson(Map<String, dynamic> json) =>
      VehicleDescriptorDto(
        vehicleDescriptorOperator:
            json['vehicle_descriptor_operator'] as String?,
        vehicleType: json['vehicle_type'] as String?,
        isWheelchairAccessible: json['is_wheelchair_accessible'] as bool?,
        isAirConditioned: json['is_air_conditioned'] as bool?,
        hasUsbChargers: json['has_usb_chargers'] as bool?,
        vehicleRegistrationNumber:
            json['vehicle_registration_number'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'vehicle_descriptor_operator': vehicleDescriptorOperator,
        'vehicle_type': vehicleType,
        'is_wheelchair_accessible': isWheelchairAccessible,
        'is_air_conditioned': isAirConditioned,
        'has_usb_chargers': hasUsbChargers,
        'vehicle_registration_number': vehicleRegistrationNumber,
      };
}
