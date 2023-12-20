import 'package:assignment/presentation/screens/person_details_cubit/person_details_cubit.dart';
import 'package:assignment/presentation/screens/person_details_cubit/person_details_state.dart';
import 'package:assignment/presentation/widgets/gallary_widget.dart';
import 'package:assignment/utils/app_debug_prints.dart';
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
      else if (cubit.personImagesModel!.profiles!.isEmpty) {
        return Center(
          child: Text(
            'No Images',
            style: AppStylesUtil.textRegularStyle(
                16, Colors.black, FontWeight.w400),
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
            itemCount: cubit.personImagesModel!.profiles!.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              printError('GGGGGGGGGGGGALLARY');
              printError(cubit.personImagesModel!.profiles![index].filePath!);
              return GallaryWidget(
                  cubit.personImagesModel!.profiles![index].filePath!, () {});
            });
      }
    });
  }
}
