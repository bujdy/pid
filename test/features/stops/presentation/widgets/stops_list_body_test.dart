import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pid/core/injection.dart';
import 'package:pid/core/widgets/app_loader.dart';
import 'package:pid/core/widgets/empty_body.dart';
import 'package:pid/core/widgets/failure_body.dart';
import 'package:pid/features/stops/application/stops_list_bloc.dart';
import 'package:pid/features/stops/presentation/screens/stops_list_screen.dart';

import '../../../../helpers/helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Stops List Body', () {
    late StopsListBloc mockStopsListBloc;

    setUpAll(() async {
      injectionWidgetTest(MockGetIt());
    });

    setUp(() {
      mockStopsListBloc = MockStopsListBloc();
      mockInGetIt<StopsListBloc>(
        mockStopsListBloc,
        thenAnswer: (_) => Stream<StopsListState>.value(StopsListStateIdle()),
      );
    });

    testWidgets(
      'renders loading state',
      (tester) async {
        when(() => mockStopsListBloc.state).thenReturn(StopsListStateLoading());
        await tester.pumpApp(const StopsListScreen());
        expect(find.byType(AppLoader), findsOneWidget);
      },
    );

    testWidgets(
      'renders error state',
      (tester) async {
        when(() => mockStopsListBloc.state).thenReturn(StopsListStateFailure());
        await tester.pumpApp(const StopsListScreen());
        expect(find.byType(FailureBody), findsOneWidget);
      },
    );

    testWidgets(
      'renders success (empty list) view',
      (tester) async {
        when(() => mockStopsListBloc.state).thenReturn(
          StopsListStateSuccess(stops: []),
        );
        await tester.pumpApp(const StopsListScreen());
        expect(find.byType(EmptyBody), findsOneWidget);
      },
    );
  });
}
