import 'package:assignment/base/base_repo.dart';
import 'package:assignment/models/person_details_model.dart';
import 'package:assignment/network/end_points.dart';
import 'package:assignment/utils/app_debug_prints.dart';

class PersonDetailsRepo extends BaseRepo {
  Future<PersonDetailsModel?> requestGetPersonDetails(int personId) {
    printWarning('In PersonDetails Repo');
    return networkManager.get<PersonDetailsModel>(
      Endpoints.REQUEST_PERSON_DETAILS + personId.toString(),
    );
  }
}
