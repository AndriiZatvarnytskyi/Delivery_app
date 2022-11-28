import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/filters/filters_bloc.dart';

class CustomCategoryFilter extends StatelessWidget {
  const CustomCategoryFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersBloc, FiltersState>(
      builder: (context, state) {
        if (state is FiltersLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        }
        if (state is FiltersLoaded) {
          return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.filter.categoryFilters.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0)),
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.filter.categoryFilters[index].category.name,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          height: 25,
                          child: Checkbox(
                            activeColor: Theme.of(context).primaryColor,
                            value: state.filter.categoryFilters[index].value,
                            onChanged: (bool? newValue) {
                              context.read<FiltersBloc>().add(
                                  UpdateCategoryFilter(
                                      categoryFilter: state
                                          .filter.categoryFilters[index]
                                          .copyWith(
                                              value: !state
                                                  .filter
                                                  .categoryFilters[index]
                                                  .value)));
                            },
                          ),
                        )
                      ]),
                );
              });
        } else {
          return const Text('Something went wrong');
        }
      },
    );
  }
}
