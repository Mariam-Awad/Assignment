import 'package:assignment/base/base_repo.dart';
import 'package:assignment/models/popular_people_model.dart';
import 'package:assignment/network/end_points.dart';
import 'package:assignment/utils/app_debug_prints.dart';

class PopularPeopleRepo extends BaseRepo {
  Future<PopularPeopleModel?> requestGetPopularList(String lang, int pageNum) {
    printWarning('In PopularPeople Repo');
    return networkManager.get<PopularPeopleModel>(
        Endpoints.REQUEST_POPULAR_PEOPLE,
        params: {"language": lang, "page": pageNum});
  }
}
