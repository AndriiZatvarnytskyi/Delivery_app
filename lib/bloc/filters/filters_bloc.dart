import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/models.dart';
part 'filters_event.dart';
part 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  FiltersBloc() : super(FiltersLoading()) {
    on<LoadFilter>(_onLoadFilter);
    on<UpdateCategoryFilter>(_onUpdateCategoryFilter);
    on<UpdatePriceFilter>(_onUpdatePriceFilter);
  }
  void _onLoadFilter(
    LoadFilter event,
    Emitter<FiltersState> emit,
  ) {
    emit(FiltersLoaded(
        filter: Filter(
      categoryFilters: CategoryFilter.filters,
      priceFilters: PriceFilter.filters,
    )));
  }

  void _onUpdateCategoryFilter(
    UpdateCategoryFilter event,
    Emitter<FiltersState> emit,
  ) {
    final state = this.state;
    if (state is FiltersLoaded) {
      final List<CategoryFilter> updatedCategoryFilters =
          state.filter.categoryFilters.map((categoryFilter) {
        return categoryFilter.id == event.categoryFilter.id
            ? event.categoryFilter
            : categoryFilter;
      }).toList();

      emit(FiltersLoaded(
          filter: Filter(
              categoryFilters: updatedCategoryFilters,
              priceFilters: state.filter.priceFilters)));
    }
  }

  void _onUpdatePriceFilter(
    UpdatePriceFilter event,
    Emitter<FiltersState> emit,
  ) {
    final state = this.state;
    if (state is FiltersLoaded) {
      final List<PriceFilter> updatedPriceFilters =
          state.filter.priceFilters.map((priceFilter) {
        return priceFilter.id == event.priceFilter.id
            ? event.priceFilter
            : priceFilter;
      }).toList();

      emit(FiltersLoaded(
          filter: Filter(
              priceFilters: updatedPriceFilters,
              categoryFilters: state.filter.categoryFilters)));
    }
  }
}
