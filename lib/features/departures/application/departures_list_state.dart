part of 'departures_list_bloc.dart';

sealed class DeparturesListState extends Equatable {
  const DeparturesListState();

  @override
  List<Object?> get props => [];
}

final class DeparturesListStateIdle extends DeparturesListState {
  const DeparturesListStateIdle();
}

final class DeparturesListStateLoading extends DeparturesListState {
  const DeparturesListStateLoading();
}

final class DeparturesListStateSuccess extends DeparturesListState {
  const DeparturesListStateSuccess({required this.departureBoards});

  final List<DepartureBoardDto> departureBoards;

  @override
  List<Object?> get props => [departureBoards];
}

final class DeparturesListStateFailure extends DeparturesListState {
  const DeparturesListStateFailure();
}
