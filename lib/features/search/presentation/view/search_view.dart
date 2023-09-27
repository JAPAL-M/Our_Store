import 'package:flutter/material.dart';
import 'package:our_store/constant.dart';
import 'package:our_store/features/search/presentation/view/widgets/search_view_body.dart';

import '../viewmodel/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
