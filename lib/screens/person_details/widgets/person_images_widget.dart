import 'package:assignment/screens/person_details/view/image_screen.dart';
import 'package:assignment/screens/person_details/person_details_cubit/person_details_cubit.dart';
import 'package:assignment/screens/person_details/person_details_cubit/person_details_state.dart';
import 'package:assignment/screens/person_details/widgets/gallary_widget.dart';
import 'package:assignment/utils/app_colors_util.dart';
import 'package:assignment/utils/app_debug_prints.dart';
import 'package:assignment/utils/app_strings.dart';
import 'package:assignment/utils/app_styles_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonImagesWidget extends StatelessWidget {
  const PersonImagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = PersonDetailsCubit.get(context);
    return BlocBuilder<PersonDetailsCubit, PersonDetailsState>(
        builder: (context, state) {
      //========================== Loading ======================
      if (state is PersonImagesLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      //============================ Error ============================
      else if (state is PersonImagesErrorState) {
        return Center(
          child: Text(
            pleaseTryAgainLater,
            style: AppStylesUtil.textRegularStyle(
                16, AppColorUtil.black, FontWeight.w400),
          ),
        );
      } else if (state is PersonImagesSuccessState &&
          cubit.personImagesModel!.profiles == []) {
        return Center(
          child: Text(
            noImages,
            style: AppStylesUtil.textRegularStyle(
                16, AppColorUtil.black, FontWeight.w400),
          ),
        );
      } else {
        return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                childAspectRatio: 210.w / 350.h),
            itemCount: cubit.personImagesModel != null
                ? cubit.personImagesModel!.profiles!.length
                : 0,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              printError(cubit.personImagesModel!.profiles![index].filePath!);
              return GallaryWidget(
                  cubit.personImagesModel!.profiles![index].filePath!, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageScreen(
                            imagePath: cubit
                                .personImagesModel!.profiles![index].filePath!,
                            width: cubit
                                .personImagesModel!.profiles![index].width!,
                            height: cubit
                                .personImagesModel!.profiles![index].height!,
                          )),
                );
              });
            });
      }
    });
  }
}
