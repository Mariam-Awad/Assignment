import 'package:assignment/presentation/screens/person_details_cubit/person_details_cubit.dart';
import 'package:assignment/presentation/widgets/person_details_widget.dart';
import 'package:assignment/presentation/widgets/popular_list_widget.dart';
import 'package:assignment/utils/app_styles_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonDetailsScreen extends StatelessWidget {
  final int id;
  const PersonDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PersonDetailsCubit>(
      create: (BuildContext context) =>
          PersonDetailsCubit()..getPersonDetails(id),
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 8.h),
            child: const PersonDetailsWidget(),
          ),
        ),
      ),
    );
  }
}
