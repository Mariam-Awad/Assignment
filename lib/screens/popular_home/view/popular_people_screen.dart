import 'package:assignment/screens/popular_home/popular_home_cubit/popular_home_cubit.dart';
import 'package:assignment/screens/popular_home/widgets/popular_list_widget.dart';
import 'package:assignment/utils/app_colors_util.dart';
import 'package:assignment/utils/app_strings.dart';
import 'package:assignment/utils/app_styles_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularHomeScreen extends StatelessWidget {
  const PopularHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PopularPeopleCubit>(
      create: (BuildContext context) => PopularPeopleCubit(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColorUtil.black,
              )),
          backgroundColor: AppColorUtil.white,
          foregroundColor: AppColorUtil.white,
          centerTitle: true,
          title: Text(
            popularPeople,
            style: AppStylesUtil.textBoldStyle(
                22.sp, AppColorUtil.black, FontWeight.w700),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 8.h),
          child: const PopularListWidget(),
        ),
      ),
    );
  }
}
