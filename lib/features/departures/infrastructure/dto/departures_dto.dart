class DepartureBoardDto {
  final DepartureDto? departure;
  final StopDto? stop;
  final RouteDto? route;
  final TripDto? trip;
  final VehicleDto? vehicle;

  DepartureBoardDto({
    this.departure,
    this.stop,
    this.route,
    this.trip,
    this.vehicle,
  });

  factory DepartureBoardDto.fromJson(Map<String, dynamic> json) {
    return DepartureBoardDto(
      departure: json['departure'] != null
          ? DepartureDto.fromJson(json['departure'])
          : null,
      stop: json['stop'] != null ? StopDto.fromJson(json['stop']) : null,
      route: json['route'] != null ? RouteDto.fromJson(json['route']) : null,
      trip: json['trip'] != null ? TripDto.fromJson(json['trip']) : null,
      vehicle:
          json['vehicle'] != null ? VehicleDto.fromJson(json['vehicle']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'departure': departure?.toJson(),
        'stop': stop?.toJson(),
        'route': route?.toJson(),
        'trip': trip?.toJson(),
        'vehicle': vehicle?.toJson(),
      };
}

class DepartureDto {
  final DateTime? timestampScheduled;
  final DateTime? timestampPredicted;
  final int? delaySeconds;
  final int? minutes;

  DepartureDto({
    this.timestampScheduled,
    this.timestampPredicted,
    this.delaySeconds,
    this.minutes,
  });

  factory DepartureDto.fromJson(Map<String, dynamic> json) {
    return DepartureDto(
      timestampScheduled: json['timestamp_scheduled'] != null
          ? DateTime.parse(json['timestamp_scheduled'])
          : null,
      timestampPredicted: json['timestamp_predicted'] != null
          ? DateTime.parse(json['timestamp_predicted'])
          : null,
      delaySeconds: json['delay_seconds'],
      minutes: json['minutes'],
    );
  }

  Map<String, dynamic> toJson() => {
        'timestamp_scheduled': timestampScheduled?.toIso8601String(),
        'timestamp_predicted': timestampPredicted?.toIso8601String(),
        'delay_seconds': delaySeconds,
        'minutes': minutes,
      };

  int get delayMinutes {
    if (delaySeconds == null) return 0;
    return (delaySeconds! / 60).floor();
  }
}

class RouteDto {
  final RouteTypeDto? type;
  final String? shortName;

  RouteDto({this.type, this.shortName});

  factory RouteDto.fromJson(Map<String, dynamic> json) {
    return RouteDto(
      type: RouteTypeDto.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => RouteTypeDto.unknown,
      ),
      shortName: json['short_name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'short_name': shortName,
      };
}

enum RouteTypeDto {
  tram,
  metro,
  train,
  bus,
  ferry,
  funicular,
  trolleybus,
  unknown
}

class StopDto {
  final String? id;
  final int? sequence;
  final String? platformCode;

  StopDto({
    this.id,
    this.sequence,
    this.platformCode,
  });

  factory StopDto.fromJson(Map<String, dynamic> json) {
    return StopDto(
      id: json['id'],
      sequence: json['sequence'],
      platformCode: json['platform_code'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'sequence': sequence,
        'platform_code': platformCode,
      };
}

class TripDto {
  final String? id;
  final String? headsign;
  final bool? isCanceled;

  TripDto({
    this.id,
    this.headsign,
    this.isCanceled,
  });

  factory TripDto.fromJson(Map<String, dynamic> json) {
    return TripDto(
      id: json['id'],
      headsign: json['headsign'],
      isCanceled: json['is_canceled'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'headsign': headsign,
        'is_canceled': isCanceled,
      };
}

class VehicleDto {
  final String? id;
  final bool? isWheelchairAccessible;
  final dynamic isAirConditioned;
  final dynamic hasCharger;

  VehicleDto({
    this.id,
    this.isWheelchairAccessible,
    this.isAirConditioned,
    this.hasCharger,
  });

  factory VehicleDto.fromJson(Map<String, dynamic> json) {
    return VehicleDto(
      id: json['id'],
      isWheelchairAccessible: json['is_wheelchair_accessible'],
      isAirConditioned: json['is_air_conditioned'],
      hasCharger: json['has_charger'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'is_wheelchair_accessible': isWheelchairAccessible,
        'is_air_conditioned': isAirConditioned,
        'has_charger': hasCharger,
      };
}
