import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pid/core/extensions/build_context_extension.dart';
import 'package:pid/core/extensions/datetime_extension.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_loader.dart';
import '../../../../core/widgets/empty_body.dart';
import '../../../../core/widgets/failure_body.dart';
import '../../../../core/widgets/gap.dart';
import '../../../map/presentation/screens/vehicle_location_screen.dart';
import '../../application/departures_list_bloc.dart';
import '../../infrastructure/dto/departures_dto.dart';

class DeparturesListBody extends StatelessWidget {
  const DeparturesListBody({super.key, required this.stopId});

  final String stopId;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context
            .read<DeparturesListBloc>()
            .add(DeparturesListRequested(stopId: stopId));
      },
      child: BlocBuilder<DeparturesListBloc, DeparturesListState>(
          builder: (context, state) {
        switch (state) {
          case DeparturesListStateIdle():
          case DeparturesListStateLoading():
            return AppLoader();
          case DeparturesListStateSuccess():
            return state.departureBoards.isEmpty
                ? EmptyBody()
                : DeparturesListView(departureBoards: state.departureBoards);
          case DeparturesListStateFailure():
            return FailureBody();
        }
      }),
    );
  }
}

class DeparturesListView extends StatelessWidget {
  const DeparturesListView({super.key, required this.departureBoards});

  final List<DepartureBoardDto> departureBoards;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) {
        var departureBoard = departureBoards[index];
        var vehicleId = departureBoard.vehicle?.id;
        return ListTile(
          contentPadding: EdgeInsets.only(left: Dimens.s16),
          leading: getTransportIcon(departureBoard.route?.type),
          horizontalTitleGap: Dimens.s8,
          title: Row(
            children: [
              Expanded(
                child: Text(departureBoard.trip?.headsign ?? ''),
              ),
              if (departureBoard.vehicle?.isWheelchairAccessible ?? false)
                Icon(
                  Icons.accessible,
                  size: Dimens.s16,
                ),
              if (departureBoard.vehicle?.isAirConditioned ?? false)
                Icon(
                  Icons.ac_unit,
                  size: Dimens.s16,
                ),
              if (departureBoard.vehicle?.hasCharger ?? false)
                Icon(
                  Icons.electrical_services,
                  size: Dimens.s16,
                ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (departureBoard.departure?.timestampScheduled
                  case final DateTime timestampScheduled)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      timestampScheduled.hoursMinutesText,
                      style: TextStyle(
                        fontSize: Dimens.s16,
                      ),
                    ),
                    if (departureBoard.departure!.delayMinutes > 0)
                      Text(
                        '+${departureBoard.departure!.delayMinutes} ${context.tr.time_min}',
                        style: TextStyle(
                          color: AppColors.error,
                        ),
                      ),
                  ],
                ),
              Visibility(
                visible: vehicleId != null,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: IconButton(
                  onPressed: () => VehicleLocationScreen.push(
                    context,
                    vehicleId: vehicleId!,
                  ),
                  icon: Icon(Icons.my_location),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (_, __) => Divider(
        height: 0,
      ),
      itemCount: departureBoards.length,
    );
  }

  Icon getTransportIcon(RouteTypeDto? type) {
    switch (type) {
      case RouteTypeDto.tram:
        return const Icon(Icons.tram);
      case RouteTypeDto.metro:
        return const Icon(Icons.subway);
      case RouteTypeDto.train:
        return const Icon(Icons.train);
      case RouteTypeDto.bus:
        return const Icon(Icons.directions_bus);
      case RouteTypeDto.ferry:
        return const Icon(Icons.directions_boat);
      case RouteTypeDto.funicular:
        return const Icon(Icons.directions_railway);
      case RouteTypeDto.trolleybus:
        return const Icon(Icons.electric_bolt);
      default:
        return const Icon(Icons.directions_transit);
    }
  }
}
