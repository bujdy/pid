import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pid/core/extensions/string_extension.dart';
import 'package:pid/core/theme/app_colors.dart';
import 'package:pid/core/widgets/failure_body.dart';
import 'package:pid/features/departures/presentation/screens/departures_list_screen.dart';
import 'package:pid/features/stops/application/stops_list_bloc.dart';

import '../../../../core/widgets/app_loader.dart';
import '../../../../core/widgets/empty_body.dart';
import '../../../../core/widgets/gap.dart';
import '../../../../core/widgets/search_text_field.dart';
import '../../infrastructure/dto/stops_dto.dart';

class StopsListBody extends StatefulWidget {
  const StopsListBody({super.key});

  @override
  State<StopsListBody> createState() => _StopsListBodyState();
}

class _StopsListBodyState extends State<StopsListBody> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<StopsListBloc>().add(StopsListRequested());
        setState(() {
          searchText = '';
        });
      },
      child:
          BlocBuilder<StopsListBloc, StopsListState>(builder: (context, state) {
        switch (state) {
          case StopsListStateIdle():
          case StopsListStateLoading():
            return AppLoader();
          case StopsListStateSuccess():
            var stops = state.stops
                .where((e) =>
                    searchText.isEmpty ||
                    (e.properties?.stopName?.normalize
                            .contains(searchText.normalize) ??
                        false))
                .toList();

            return state.stops.isEmpty
                ? EmptyBody()
                : Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(Dimens.s16),
                        child: SearchTextField(
                          onSearch: (value) {
                            setState(() {
                              searchText = value;
                            });
                          },
                        ),
                      ),
                      stops.isEmpty
                          ? EmptyBody()
                          : Expanded(
                              child: StopsListview(stops: stops),
                            ),
                    ],
                  );
          case StopsListStateFailure():
            return FailureBody();
        }
      }),
    );
  }
}

class StopsListview extends StatelessWidget {
  const StopsListview({super.key, required this.stops});

  final List<StopDto> stops;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) {
        var stop = stops[index];
        return ListTile(
          leading: Text(
            stop.properties?.zoneId ?? '',
            style:
                TextStyle(color: AppColors.text, fontWeight: FontWeight.bold),
          ),
          trailing: ((stop.properties?.wheelchairBoarding ?? 0) > 0)
              ? RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: stop.properties?.wheelchairBoarding.toString(),
                        style: TextStyle(
                            color: AppColors.text, fontWeight: FontWeight.bold),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Icon(Icons.accessible),
                      ),
                    ],
                  ),
                )
              : null,
          horizontalTitleGap: Dimens.s8,
          title: Text(stop.properties?.stopName ?? ''),
          onTap: stop.properties?.stopId != null
              ? () {
                  DeparturesListScreen.push(context,
                      stopId: stop.properties!.stopId!);
                }
              : null,
        );
      },
      separatorBuilder: (_, __) => Divider(
        height: 0,
      ),
      itemCount: stops.length,
    );
  }
}
