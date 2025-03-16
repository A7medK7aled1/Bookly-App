import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indector.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/features/search/manager/cubit/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_search_bar.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_search_text_fiel.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, right: 30, left: 2),
                child: Column(
                  children: [
                    CustomSearchAppBar(),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Search Results',
                          style: Styles.textStyle18.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            state is SearchLoading
                ? const SliverFillRemaining(
                    child: CustomLoadingIndector(),
                  )
                : SliverFillRemaining(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: BlocBuilder<SearchCubit, SearchState>(
                        builder: (context, state) {
                          if (state is SearchSuccess) {
                            return SearchResultListView(
                              searchBooksResult: state.books,
                            );
                          } else if (state is SearchLoading) {
                            return const CustomLoadingIndector();
                          } else if (state is SearchInitial) {
                            return const Center(
                              child: Text(
                                'Search for books 🔎',
                                style: Styles.textStyle18,
                              ),
                            );
                          } else {
                            return CustomErrorWidget(
                              errMessage: state is SearchFailure
                                  ? state.errorMsg
                                  : 'An error occurred',
                            );
                          }
                        },
                      ),
                    ),
                  ),
          ],
        );
      },
    );
  }
}
