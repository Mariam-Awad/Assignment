import 'package:assignment/network/end_points.dart';
import 'package:assignment/presentation/screens/person_details_cubit/person_details_cubit.dart';
import 'package:assignment/presentation/screens/person_details_cubit/person_details_state.dart';
import 'package:assignment/presentation/widgets/gallary_widget.dart';
import 'package:assignment/presentation/widgets/person_images_widget.dart';
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
            'Pleasr try again later!',
            style: AppStylesUtil.textRegularStyle(
                16, Colors.black, FontWeight.w400),
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
                  24.sp, Colors.black, FontWeight.w700),
            ),
            8.verticalSpace,
            Text(
              'Biography',
              textAlign: TextAlign.start,
              textScaler: const TextScaler.linear(0.97),
              style: AppStylesUtil.textSemiBoldStyle(
                  18.sp, Colors.black, FontWeight.w600),
            ),
            8.verticalSpace,
            Text(
              cubit.personDetailsModel!.biography!,
              textAlign: TextAlign.start,
              textScaler: const TextScaler.linear(0.97),
              style: AppStylesUtil.textRegularStyle(
                  14.sp, Colors.black, FontWeight.w400),
            ),
            8.verticalSpace,
            Text(
              'Personal Info: ',
              textAlign: TextAlign.start,
              textScaler: const TextScaler.linear(0.97),
              style: AppStylesUtil.textSemiBoldStyle(
                  18.sp, Colors.black, FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Known For: ',
                  textAlign: TextAlign.start,
                  textScaler: const TextScaler.linear(0.97),
                  style: AppStylesUtil.textSemiBoldStyle(
                      18.sp, Colors.black, FontWeight.w600),
                ),
                12.horizontalSpace,
                Text(
                  cubit.personDetailsModel!.knownForDepartment!,
                  textAlign: TextAlign.start,
                  textScaler: const TextScaler.linear(0.97),
                  style: AppStylesUtil.textRegularStyle(
                      14.sp, Colors.black, FontWeight.w400),
                ),
              ],
            ),
            8.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Gender: ',
                  textAlign: TextAlign.start,
                  textScaler: const TextScaler.linear(0.97),
                  style: AppStylesUtil.textSemiBoldStyle(
                      18.sp, Colors.black, FontWeight.w600),
                ),
                12.horizontalSpace,
                Text(
                  cubit.personDetailsModel!.gender == 1 ? 'Female' : 'Male',
                  textAlign: TextAlign.start,
                  textScaler: const TextScaler.linear(0.97),
                  style: AppStylesUtil.textRegularStyle(
                      14.sp, Colors.black, FontWeight.w400),
                ),
              ],
            ),
            8.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Birthday: ',
                  textAlign: TextAlign.start,
                  textScaler: const TextScaler.linear(0.97),
                  style: AppStylesUtil.textSemiBoldStyle(
                      18.sp, Colors.black, FontWeight.w600),
                ),
                12.horizontalSpace,
                Text(
                  cubit.personDetailsModel!.birthday!,
                  textAlign: TextAlign.start,
                  textScaler: const TextScaler.linear(0.97),
                  style: AppStylesUtil.textRegularStyle(
                      14.sp, Colors.black, FontWeight.w400),
                ),
              ],
            ),
            8.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Place of Birth: ',
                  textAlign: TextAlign.start,
                  textScaler: const TextScaler.linear(0.97),
                  style: AppStylesUtil.textSemiBoldStyle(
                      18.sp, Colors.black, FontWeight.w600),
                ),
                12.horizontalSpace,
                Expanded(
                  child: Text(
                    cubit.personDetailsModel!.placeOfBirth ?? '',
                    textAlign: TextAlign.start,
                    textScaler: const TextScaler.linear(0.97),
                    style: AppStylesUtil.textRegularStyle(
                        14.sp, Colors.black, FontWeight.w400),
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Also Known As : ',
                  textAlign: TextAlign.start,
                  textScaler: const TextScaler.linear(0.97),
                  style: AppStylesUtil.textSemiBoldStyle(
                      18.sp, Colors.black, FontWeight.w600),
                ),
                12.horizontalSpace,
                Expanded(
                  child: Text(
                    cubit.alsoknownAs(cubit.personDetailsModel!.alsoKnownAs!) ??
                        '',
                    textAlign: TextAlign.start,
                    textScaler: const TextScaler.linear(0.97),
                    style: AppStylesUtil.textRegularStyle(
                        14.sp, Colors.black, FontWeight.w400),
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            Text(
              cubit.personDetailsModel!.gender == 1
                  ? 'Her Images'
                  : 'His images',
              textAlign: TextAlign.start,
              textScaler: const TextScaler.linear(0.97),
              style: AppStylesUtil.textSemiBoldStyle(
                  18.sp, Colors.black, FontWeight.w600),
            ),
            8.verticalSpace,
            const PersonImagesWidget(),
          ],
        );
      }
    });
  }
}
