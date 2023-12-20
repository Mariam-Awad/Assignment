import 'package:assignment/network/end_points.dart';
import 'package:assignment/screens/person_details/person_details_cubit/person_details_cubit.dart';
import 'package:assignment/screens/person_details/person_details_cubit/person_details_state.dart';
import 'package:assignment/screens/person_details/widgets/person_images_widget.dart';
import 'package:assignment/utils/app_colors_util.dart';
import 'package:assignment/utils/app_strings.dart';
import 'package:assignment/utils/app_styles_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonDetailsWidget extends StatelessWidget {
  const PersonDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = PersonDetailsCubit.get(context);
    return BlocBuilder<PersonDetailsCubit, PersonDetailsState>(
        builder: (context, state) {
      //========================== Loading ======================
      if (state is PersonDetailsLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      //============================ Error ============================
      else if (cubit.personDetailsModel == null) {
        return Center(
          child: Text(
            pleaseTryAgainLater,
            style: AppStylesUtil.textRegularStyle(
                16, AppColorUtil.black, FontWeight.w400),
          ),
        );
      }
      //============================ Success ===========================
      else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  child: CachedNetworkImage(
                    fit: BoxFit.contain,
                    imageUrl: '${Endpoints.REQUEST_NETWORK_IMAGE}' +
                        cubit.personDetailsModel!.profilePath!,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            Text(
              cubit.personDetailsModel!.name!,
              textAlign: TextAlign.start,
              textScaler: const TextScaler.linear(0.97),
              style: AppStylesUtil.textBoldStyle(
                  24.sp, AppColorUtil.black, FontWeight.w700),
            ),
            8.verticalSpace,
            Text(
              biography,
              textAlign: TextAlign.start,
              textScaler: const TextScaler.linear(0.97),
              style: AppStylesUtil.textSemiBoldStyle(
                  18.sp, AppColorUtil.black, FontWeight.w600),
            ),
            8.verticalSpace,
            Text(
              cubit.personDetailsModel!.biography!,
              textAlign: TextAlign.start,
              textScaler: const TextScaler.linear(0.97),
              style: AppStylesUtil.textRegularStyle(
                  14.sp, AppColorUtil.black, FontWeight.w400),
            ),
            8.verticalSpace,
            Text(
              personalInfo,
              textAlign: TextAlign.start,
              textScaler: const TextScaler.linear(0.97),
              style: AppStylesUtil.textSemiBoldStyle(
                  18.sp, AppColorUtil.black, FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  knowFor,
                  textAlign: TextAlign.start,
                  textScaler: const TextScaler.linear(0.97),
                  style: AppStylesUtil.textSemiBoldStyle(
                      18.sp, AppColorUtil.black, FontWeight.w600),
                ),
                12.horizontalSpace,
                Text(
                  cubit.personDetailsModel!.knownForDepartment!,
                  textAlign: TextAlign.start,
                  textScaler: const TextScaler.linear(0.97),
                  style: AppStylesUtil.textRegularStyle(
                      14.sp, AppColorUtil.black, FontWeight.w400),
                ),
              ],
            ),
            8.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  gender,
                  textAlign: TextAlign.start,
                  textScaler: const TextScaler.linear(0.97),
                  style: AppStylesUtil.textSemiBoldStyle(
                      18.sp, AppColorUtil.black, FontWeight.w600),
                ),
                12.horizontalSpace,
                Text(
                  cubit.personDetailsModel!.gender == 1 ? female : male,
                  textAlign: TextAlign.start,
                  textScaler: const TextScaler.linear(0.97),
                  style: AppStylesUtil.textRegularStyle(
                      14.sp, AppColorUtil.black, FontWeight.w400),
                ),
              ],
            ),
            8.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  birthday,
                  textAlign: TextAlign.start,
                  textScaler: const TextScaler.linear(0.97),
                  style: AppStylesUtil.textSemiBoldStyle(
                      18.sp, AppColorUtil.black, FontWeight.w600),
                ),
                12.horizontalSpace,
                Text(
                  cubit.personDetailsModel!.birthday!,
                  textAlign: TextAlign.start,
                  textScaler: const TextScaler.linear(0.97),
                  style: AppStylesUtil.textRegularStyle(
                      14.sp, AppColorUtil.black, FontWeight.w400),
                ),
              ],
            ),
            8.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  placeOfBirth,
                  textAlign: TextAlign.start,
                  textScaler: const TextScaler.linear(0.97),
                  style: AppStylesUtil.textSemiBoldStyle(
                      18.sp, AppColorUtil.black, FontWeight.w600),
                ),
                12.horizontalSpace,
                Expanded(
                  child: Text(
                    cubit.personDetailsModel!.placeOfBirth ?? '',
                    textAlign: TextAlign.start,
                    textScaler: const TextScaler.linear(0.97),
                    style: AppStylesUtil.textRegularStyle(
                        14.sp, AppColorUtil.black, FontWeight.w400),
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  alsoKnownAs,
                  textAlign: TextAlign.start,
                  textScaler: const TextScaler.linear(0.97),
                  style: AppStylesUtil.textSemiBoldStyle(
                      18.sp, AppColorUtil.black, FontWeight.w600),
                ),
                12.horizontalSpace,
                Expanded(
                  child: Text(
                    cubit.alsoknownAs(cubit.personDetailsModel!.alsoKnownAs!) ??
                        '',
                    textAlign: TextAlign.start,
                    textScaler: const TextScaler.linear(0.97),
                    style: AppStylesUtil.textRegularStyle(
                        14.sp, AppColorUtil.black, FontWeight.w400),
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            Text(
              cubit.personDetailsModel!.gender == 1
                  ? herImages
                  : hisImages,
              textAlign: TextAlign.start,
              textScaler: const TextScaler.linear(0.97),
              style: AppStylesUtil.textSemiBoldStyle(
                  18.sp, AppColorUtil.black, FontWeight.w600),
            ),
            8.verticalSpace,
            const PersonImagesWidget(),
          ],
        );
      }
    });
  }
}
