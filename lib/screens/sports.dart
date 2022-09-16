
import 'package:aaaaaa/bloc/bloc/cubit.dart';
import 'package:aaaaaa/bloc/bloc/stute.dart';
import 'package:aaaaaa/shared/coponents/componants.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class sportsScreen extends StatelessWidget {
  const sportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;
        return ItmeScreen( list,context);

      },
    );
  }
}
