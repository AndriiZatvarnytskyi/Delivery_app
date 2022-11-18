part of 'autocomplate_bloc.dart';

abstract class AutocomplateState extends Equatable {
  const AutocomplateState();

  @override
  List<Object> get props => [];
}

class AutocomplateLoading extends AutocomplateState {}

class AutocomplateLoaded extends AutocomplateState {
  final List<PlaceAutocomplate> autocomplate;
  const AutocomplateLoaded({required this.autocomplate});

  @override
  List<Object> get props => [autocomplate];
}

class AutocomplateError extends AutocomplateState {}
