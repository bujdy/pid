import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pid/core/extensions/build_context_extension.dart';
import 'package:pid/core/injection.dart';
import 'package:pid/core/widgets/app_scaffold.dart';
import 'package:pid/features/stops/application/stops_list_bloc.dart';
import 'package:pid/features/stops/presentation/screens/stops_list_screen.dart';
import 'package:pid/features/stops/presentation/widgets/stops_list_body.dart';

import '../../../../helpers/helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Stops List Screen', () {
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
      'renders screen',
      (tester) async {
        when(() => mockStopsListBloc.state).thenReturn(StopsListStateIdle());

        var context = await tester.pumpApp(
          const StopsListScreen(),
        );
        expect(find.byType(AppScaffold), findsOneWidget);
        expect(find.text(context.tr.stops_list_title), findsOneWidget);
        expect(find.byType(StopsListBody), findsOneWidget);
      },
    );
  });
}
