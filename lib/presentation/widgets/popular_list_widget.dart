import 'package:assignment/presentation/screens/popular_home_cubit/popular_home_cubit.dart';
import 'package:assignment/presentation/screens/popular_home_cubit/popular_people_state.dart';
import 'package:assignment/presentation/widgets/popular_card_widget.dart';
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
      //============================ Error ============================
      else if (cubit.responseGetPopularList == null) {
        return Center(
          child: Text(
            'Error!',
            style: AppStylesUtil.textRegularStyle(
                16, Colors.black, FontWeight.w400),
          ),
        );
      }
      //============================ Success ===========================
      else if (cubit.allPeople.isEmpty) {
        return Center(
          child: Text(
            'No People for Show!',
            style: AppStylesUtil.textRegularStyle(
                16, Colors.black, FontWeight.w400),
          ),
        );
      } else {
        print('000000000000');
        return NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollEndNotification &&
                scrollNotification.metrics.extentAfter == 0) {
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
                      cubit.allPeople[index].name!, res ?? '', () {});
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
