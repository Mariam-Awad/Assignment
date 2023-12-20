import 'package:assignment/presentation/screens/popular_home_cubit/popular_home_cubit.dart';
import 'package:assignment/presentation/widgets/popular_list_widget.dart';
import 'package:assignment/utils/app_styles_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularHomeScreen extends StatelessWidget {
  const PopularHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PopularPeopleCubit>(
      create: (BuildContext context) =>
          PopularPeopleCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 8.h),
            child: Column(
              children: [
                Align(
                    child: Text(
                  'Popular People',
                  style: AppStylesUtil.textBoldStyle(
                      22.sp, Colors.black, FontWeight.w700),
                )),
                const PopularListWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
