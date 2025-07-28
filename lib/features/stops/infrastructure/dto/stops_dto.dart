class StopsDto {
  final List<StopDto>? stops;
  final String? type;

  StopsDto({
    this.stops,
    this.type,
  });

  factory StopsDto.fromJson(Map<String, dynamic> json) {
    return StopsDto(
      stops: (json['features'] as List<dynamic>?)
          ?.map((e) => StopDto.fromJson(e))
          .toList(),
      type: json['type'] as String?,
    );
  }
}

class StopDto {
  final GeometryDto? geometry;
  final PropertiesDto? properties;

  StopDto({
    this.geometry,
    this.properties,
  });

  factory StopDto.fromJson(Map<String, dynamic> json) {
    return StopDto(
      geometry: json['geometry'] != null
          ? GeometryDto.fromJson(json['geometry'])
          : null,
      properties: json['properties'] != null
          ? PropertiesDto.fromJson(json['properties'])
          : null,
    );
  }
}

class GeometryDto {
  final List<double>? coordinates;
  final GeometryTypeDto? type;

  GeometryDto({
    this.coordinates,
    this.type,
  });

  factory GeometryDto.fromJson(Map<String, dynamic> json) {
    return GeometryDto(
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      type: _geometryTypeFromJson(json['type']),
    );
  }

  static GeometryTypeDto? _geometryTypeFromJson(String? value) {
    switch (value) {
      case 'Point':
        return GeometryTypeDto.point;
      default:
        return null;
    }
  }
}

enum GeometryTypeDto { point }

class PropertiesDto {
  final int? locationType;
  final String? parentStation;
  final String? platformCode;
  final String? stopId;
  final String? stopName;
  final int? wheelchairBoarding;
  final String? zoneId;
  final String? levelId;

  PropertiesDto({
    this.locationType,
    this.parentStation,
    this.platformCode,
    this.stopId,
    this.stopName,
    this.wheelchairBoarding,
    this.zoneId,
    this.levelId,
  });

  factory PropertiesDto.fromJson(Map<String, dynamic> json) {
    return PropertiesDto(
      locationType: json['location_type'] as int?,
      parentStation: json['parent_station'] as String?,
      platformCode: json['platform_code'] as String?,
      stopId: json['stop_id'] as String?,
      stopName: json['stop_name'] as String?,
      wheelchairBoarding: json['wheelchair_boarding'] as int?,
      zoneId: json['zone_id'] as String?,
      levelId: json['level_id'] as String?,
    );
  }
}
