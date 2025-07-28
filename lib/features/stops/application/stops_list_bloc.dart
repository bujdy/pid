import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pid/core/models/result.dart';

import '../domain/repositories/stops_repository.dart';
import '../infrastructure/dto/stops_dto.dart';

part 'stops_list_event.dart';
part 'stops_list_state.dart';

class StopsListBloc extends Bloc<StopsListEvent, StopsListState> {
  StopsListBloc({required this.stopsRepository})
      : super(const StopsListStateIdle()) {
    on<StopsListRequested>(_onStopsListRequested);
  }

  final IStopsRepository stopsRepository;

  Future<void> _onStopsListRequested(
    StopsListRequested event,
    Emitter<StopsListState> emit,
  ) async {
    emit(const StopsListStateLoading());
    var result = await stopsRepository.getStopsList();
    await result.when(success: (data) async {
      emit(StopsListStateSuccess(stops: data.stops ?? []));
    }, failure: (error) {
      emit(const StopsListStateFailure());
    });
  }
}
