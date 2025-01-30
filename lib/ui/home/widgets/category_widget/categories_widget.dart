import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/ui/home/widgets/category_widget/categories_success_widget.dart';

import 'bloc/category_bloc.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      buildWhen: (previous, current) => current.status.isSuccess,
      builder: (context, state) {
        return CategoriesSuccessWidget();
      },
    );
  }
}