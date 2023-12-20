import 'package:assignment/screens/popular_home/popular_home_cubit/popular_home_cubit.dart';
import 'package:assignment/screens/popular_home/popular_home_cubit/popular_people_state.dart';
import 'package:assignment/screens/popular_home/widgets/popular_card_widget.dart';
import 'package:assignment/utils/app_colors_util.dart';
import 'package:assignment/utils/app_debug_prints.dart';
import 'package:assignment/utils/app_routes.dart';
import 'package:assignment/utils/app_strings.dart';
import 'package:assignment/utils/app_styles_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularListWidget extends StatelessWidget {
  const PopularListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = PopularPeopleCubit.get(context);
    return BlocBuilder<PopularPeopleCubit, PopularState>(
        builder: (context, state) {
      //========================== Loading ======================
      if (state is GetAllPopularPeopleLoadingState && cubit.allPeople.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      //============================ Success ===========================
      else if (state is GetAllPopularPeopleErrorState) {
        return Center(
          child: Text(
            noPeopleForShow,
            style: AppStylesUtil.textRegularStyle(
                16, AppColorUtil.black, FontWeight.w400),
          ),
        );
      } else {
        return NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollEndNotification &&
                scrollNotification.metrics.extentAfter == 0) {
              printDone('PAGINATION CALL');
              cubit.paginationFun();
            }
            return false;
          },
          child: GridView.builder(
              controller: PopularPeopleCubit.get(context).scrollController,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  childAspectRatio: 210.w / 350.h),
              itemCount: cubit.allPeople.length + (cubit.isLoading ? 1 : 0),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                String? res = cubit.knownFor(cubit.allPeople[index].knownFor!);
                if (index < cubit.allPeople.length) {
                  return PopularCardWidget(cubit.allPeople[index].profilePath!,
                      cubit.allPeople[index].name!, res ?? '', () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.personDetailsRouteName,
                      arguments: cubit.allPeople[index].id,
                    );
                  });
                } else {
                  return IconButton(
                    onPressed: () {
                      cubit.getPopularPeopleList();
                    },
                    icon: const Icon(Icons.refresh),
                  );
                }
              }),
        );
      }
    });
  }
}
