import 'dart:async';
import 'package:delivery_app/models/plasce_autocomplate_model.dart';
import 'package:delivery_app/repositories/places/place_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'autocomplate_event.dart';
part 'autocomplate_state.dart';

class AutocomplateBloc extends Bloc<AutocomplateEvent, AutocomplateState> {
  final PlaceRepository _placeRepository;
  StreamSubscription? _placeSupscription;

  AutocomplateBloc({
    required PlaceRepository placeRepository,
  })  : _placeRepository = placeRepository,
        super(AutocomplateLoading());

  @override
  Stream<AutocomplateState> mapEventToState(
    AutocomplateEvent event,
  ) async* {
    if (event is LoadAutocomplate) {
      yield* _mapLoadAutocomplateToState(event);
    }
  }

  Stream<AutocomplateState> _mapLoadAutocomplateToState(
      LoadAutocomplate event) async* {
    _placeSupscription?.cancel();
    final List<PlaceAutocomplate> autocomplate =
        await _placeRepository.getAutocomplate(event.searchInput);
    yield AutocomplateLoaded(autocomplate: autocomplate);
  }
}
