part of 'helpers.dart';

extension PumpApp on WidgetTester {
  Future<BuildContext> pumpApp(Widget widget) async {
    late BuildContext context;
    final app = MaterialApp(
      localizationsDelegates: AppLocalizations.localizationDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: InheritedGoRouter(
        goRouter: MockGoRouter(),
        child: Builder(
          builder: (ctx) {
            context = ctx;
            return widget;
          },
        ),
      ),
    );

    await pumpWidget(
      app,
    );

    return context;
  }
}
