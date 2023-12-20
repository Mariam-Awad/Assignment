import 'package:assignment/cache/app_cache.dart';
import 'package:assignment/models/person_details_model.dart';
import 'package:assignment/presentation/screens/person_details_cubit/person_details_state.dart';
import 'package:assignment/repositories/person_details_repo.dart';
import 'package:assignment/utils/app_debug_prints.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonDetailsCubit extends Cubit<PersonDetailsState> {
  PersonDetailsCubit() : super(PersonDetailsInitialState());
  static PersonDetailsCubit get(context) => BlocProvider.of(context);

  PersonDetailsModel? personDetailsModel;
  PersonDetailsRepo personRepo = PersonDetailsRepo();

  getPersonDetails(int id) async {
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

    String? alsoknownAs(List<String> list) {
    String result = list.map((e) => e).join(', ');
    return result;
  }
}
