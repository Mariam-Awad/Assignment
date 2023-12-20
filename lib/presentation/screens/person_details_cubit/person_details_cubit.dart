import 'package:assignment/cache/app_cache.dart';
import 'package:assignment/models/person_details_model.dart';
import 'package:assignment/models/person_images_model.dart';
import 'package:assignment/presentation/screens/person_details_cubit/person_details_state.dart';
import 'package:assignment/repositories/person_details_repo.dart';
import 'package:assignment/utils/app_debug_prints.dart';
import 'package:assignment/utils/app_styles_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';

class PersonDetailsCubit extends Cubit<PersonDetailsState> {
  PersonDetailsCubit() : super(PersonDetailsInitialState());
  static PersonDetailsCubit get(context) => BlocProvider.of(context);

  PersonDetailsModel? personDetailsModel;
  PersonImagesModel? personImagesModel;
  PersonDetailsRepo personRepo = PersonDetailsRepo();

  getPersonDetails(int id) async {
    getPersonImages(id);
    printDone('in getPersonDetails func');
    emit(PersonDetailsLoadingState());
    personDetailsModel = await personRepo.requestGetPersonDetails(id);
    if (personDetailsModel != null) {
      AppCache.instance.setPersonDetails(personDetailsModel);
      printDone(personDetailsModel!.name!);
      emit(PersonDetailsSuccessState());
    } else {
      emit(PersonDetailsErrorState());
    }
  }

  getPersonImages(int id) async {
    printDone('in getPersonImages func');
    emit(PersonImagesLoadingState());
    personImagesModel = await personRepo.requestGetPersonImages(id);
    if (personImagesModel != null) {
      AppCache.instance.setPersonImages(personImagesModel);
      printDone(personImagesModel!.profiles!);
      emit(PersonImagesSuccessState());
    } else {
      emit(PersonImagesErrorState());
    }
  }

  String? alsoknownAs(List<String> list) {
    String result = list.map((e) => e).join(', ');
    return result;
  }

  void saveNetworkImage(String path, BuildContext context) async {
    await GallerySaver.saveImage(path).then((bool? success) {
      if (success != null && success == true) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
            content: Text(
              'Saved Successfully',
              textAlign: TextAlign.center,
              style: AppStylesUtil.textRegularStyle(
                  18, Colors.white, FontWeight.w400),
            )));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
            content: Text(
              'Not Saved Successfully',
              textAlign: TextAlign.center,
              style: AppStylesUtil.textRegularStyle(
                  18, Colors.white, FontWeight.w400),
            )));
      }
    });
  }
}
