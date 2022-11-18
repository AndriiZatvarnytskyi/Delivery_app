part of 'autocomplate_bloc.dart';

abstract class AutocomplateEvent extends Equatable {
  const AutocomplateEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class LoadAutocomplate extends AutocomplateEvent {
  late String searchInput;

  LoadAutocomplate({this.searchInput = ''});

  @override
  List<Object> get props => [searchInput];
}
