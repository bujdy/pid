import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pid/core/injection.dart';
import 'package:pid/features/stops/application/stops_list_bloc.dart';
import 'package:pid/features/stops/domain/repositories/stops_repository.dart';
import 'package:pid/l10n/l10n.dart';

part 'injection_mock.dart';
part 'pump_app.dart';

void mockInGetIt<T extends BlocBase>(T mock,
    {Stream<dynamic> Function(Invocation)? thenAnswer}) {
  when(() => getIt.get<T>()).thenReturn(mock);
  when(() => getIt.call<T>()).thenReturn(mock);

  if (thenAnswer != null) {
    when(() => mock.stream).thenAnswer((invocation) => thenAnswer(invocation));
  }

  when(() => mock.close()).thenAnswer((_) async {});
}
