part of 'departures_list_bloc.dart';

sealed class DeparturesListEvent extends Equatable {
  const DeparturesListEvent();

  @override
  List<Object?> get props => [];
}

final class DeparturesListRequested extends DeparturesListEvent {
  const DeparturesListRequested({required this.stopId});

  final String stopId;

  @override
  List<Object?> get props => [stopId];
}
