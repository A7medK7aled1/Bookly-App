import 'package:bookly_app/features/search/manager/cubit/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_search_text_fiel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomSearchAppBar extends StatelessWidget {
  const CustomSearchAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: const EdgeInsets.only(right: 12),
          onPressed: () => GoRouter.of(context).pop(),
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.white,
            size: 30,
          ),
        ),
        Expanded(
          child: CustomSearchTextField(
            onChanged: (input) {
              BlocProvider.of<SearchCubit>(context).getSearchBooks(input);
            },
            onSubmitted: (input) {
              BlocProvider.of<SearchCubit>(context).getSearchBooks(input);
            },
          ),
        ),
      ],
    );
  }
}
