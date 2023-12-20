import 'package:assignment/models/person_details_model.dart';
import 'package:assignment/models/person_images_model.dart';
import 'package:assignment/models/popular_people_model.dart';
import 'package:assignment/utils/app_debug_prints.dart';

class Parser {
  // To parse a response to a model dynamically
  static parse<T>(dynamic json) {
    printWarning(json);
    switch (T) {
      case PopularPeopleModel:
        return PopularPeopleModel.fromJson(json);
      case PersonDetailsModel:
        return PersonDetailsModel.fromJson(json);
      case PersonImagesModel:
        return PersonImagesModel.fromJson(json);
    }
  }
}
