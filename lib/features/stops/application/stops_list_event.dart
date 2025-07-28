part of 'stops_list_bloc.dart';

sealed class StopsListEvent extends Equatable {
  const StopsListEvent();

  @override
  List<Object?> get props => [];
}

final class StopsListRequested extends StopsListEvent {
  const StopsListRequested();

  @override
  List<Object?> get props => [];
}
