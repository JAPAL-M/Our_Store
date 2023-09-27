import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:our_store/features/search/presentation/viewmodel/search_cubit.dart';

import '../../../../../core/utils/Styles.dart';
import '../../../../home/presentation/view/widgets/HotSalesInfoItem.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: SearchCubit.get(context).searchText,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            label: const Text('Search'),
            prefixIcon: const Icon(Icons.search),
          ),
          onChanged: (value) {
            SearchCubit.get(context).searchProduct();
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 40,
        ),
        Text(
          'Search Result',
          style: Styles.textstyle14,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 40,
        ),
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchSuccess) {
              return MasonryGridView.builder(
                  padding: const EdgeInsets.all(20),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.products.length,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => HotSalesInfoItem(
                        products: state.products[index],
                      ));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        )
      ],
    );
  }
}
