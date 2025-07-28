import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pid/core/models/result.dart';
import 'package:pid/features/departures/domain/repositories/departures_repository.dart';

import '../infrastructure/dto/departures_dto.dart';

part 'departures_list_event.dart';
part 'departures_list_state.dart';

class DeparturesListBloc
    extends Bloc<DeparturesListEvent, DeparturesListState> {
  DeparturesListBloc({required this.departuresRepository})
      : super(const DeparturesListStateIdle()) {
    on<DeparturesListRequested>(_onDeparturesListRequested);
  }

  final IDeparturesRepository departuresRepository;

  Future<void> _onDeparturesListRequested(
    DeparturesListRequested event,
    Emitter<DeparturesListState> emit,
  ) async {
    emit(const DeparturesListStateLoading());
    var result = await departuresRepository.getDepartureBoards([event.stopId]);
    await result.when(success: (data) async {
      emit(
        DeparturesListStateSuccess(departureBoards: data),
      );
    }, failure: (error) {
      emit(const DeparturesListStateFailure());
    });
  }
}
