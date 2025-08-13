part of 'helpers.dart';

class MockGetIt extends Mock implements GetIt {}

class MockGoRouter extends Mock implements GoRouter {
  factory MockGoRouter() {
    final instance = _instance;

    when(() => instance.routerDelegate).thenReturn(_delegate);

    return instance;
  }

  MockGoRouter._internal();

  static final MockGoRouter _instance = MockGoRouter._internal();
  static final MockRouterDelegate _delegate = MockRouterDelegate();
}

class MockRouterDelegate extends Mock implements GoRouterDelegate {}

class MockStopsRepository extends Mock implements IStopsRepository {}

class MockStopsListBloc extends Mock implements StopsListBloc {}
