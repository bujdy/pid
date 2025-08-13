import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pid/core/injection.dart';
import 'package:pid/core/models/result.dart';
import 'package:pid/features/stops/application/stops_list_bloc.dart';
import 'package:pid/features/stops/domain/repositories/stops_repository.dart';
import 'package:pid/features/stops/infrastructure/dto/stops_dto.dart';

import '../../../helpers/helpers.dart';

void main() {
  late IStopsRepository repository;

  late StopsListBloc stopsListBloc;

  group('Stops List Bloc', () {
    var stops = [
      StopDto(),
      StopDto(),
      StopDto(),
    ];

    setUpAll(() async {
      injectionWidgetTest(MockGetIt());
    });

    setUp(() {
      repository = MockStopsRepository();
      stopsListBloc = StopsListBloc(
        stopsRepository: repository,
      );
    });

    tearDown(() {
      stopsListBloc.close();
    });

    blocTest<StopsListBloc, StopsListState>(
      '[StopsListRequested] emits [Loading, Success (empty list)]',
      build: () {
        when(() => repository.getStopsList()).thenAnswer((_) async {
          return Success(StopsDto());
        });
        return stopsListBloc;
      },
      act: (bloc) {
        bloc.add(
          StopsListRequested(),
        );
      },
      expect: () => [
        StopsListStateLoading(),
        StopsListStateSuccess(stops: []),
      ],
    );

    blocTest<StopsListBloc, StopsListState>(
      '[StopsListRequested] emits [Loading, Success]',
      build: () {
        when(() => repository.getStopsList()).thenAnswer((_) async {
          return Success(
            StopsDto(
              stops: stops,
            ),
          );
        });
        return stopsListBloc;
      },
      act: (bloc) {
        bloc.add(
          StopsListRequested(),
        );
      },
      expect: () => [
        StopsListStateLoading(),
        StopsListStateSuccess(stops: stops),
      ],
    );
  });
}
