part of 'stops_list_bloc.dart';

sealed class StopsListState extends Equatable {
  const StopsListState();

  @override
  List<Object?> get props => [];
}

final class StopsListStateIdle extends StopsListState {
  const StopsListStateIdle();
}

final class StopsListStateLoading extends StopsListState {
  const StopsListStateLoading();
}

final class StopsListStateSuccess extends StopsListState {
  const StopsListStateSuccess({required this.stops});

  final List<StopDto> stops;

  @override
  List<Object?> get props => [stops];
}

final class StopsListStateFailure extends StopsListState {
  const StopsListStateFailure();
}
