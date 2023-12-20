import 'dart:developer';

import 'package:assignment/cache/app_cache.dart';
import 'package:assignment/models/popular_people_model.dart';
import 'package:assignment/presentation/screens/popular_home_cubit/popular_people_state.dart';
import 'package:assignment/repositories/popular_people_repo.dart';
import 'package:assignment/utils/app_debug_prints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularPeopleCubit extends Cubit<PopularState> {
  PopularPeopleCubit() : super(PopularInitialState());

  static PopularPeopleCubit get(context) => BlocProvider.of(context);

  PopularPeopleModel? responseGetPopularList;
  PopularPeopleRepo popularRepo = PopularPeopleRepo();
  String lang = 'en-US';

  List<Results> allPeople = [];
  final ScrollController scrollController = ScrollController();
  int currentPage = 1;
  int lastPage = 1;
  bool isLoading = false;

  getPopularPeopleList() async {
    emit(GetAllPopularPeopleLoadingState());
    responseGetPopularList =
        await popularRepo.requestGetPopularList(lang, currentPage);
    if (responseGetPopularList != null &&
        responseGetPopularList!.results != null) {
      AppCache.instance.setPopularList(responseGetPopularList);
      allPeople.addAll(responseGetPopularList!.results!);
      isLoading = false;
      lastPage = responseGetPopularList!.totalPages ?? 1;
      printDone(allPeople.length);
      emit(GetAllPopularPeopleSuccessState());
    } else {
      emit(GetAllPopularPeopleErrorState());
    }
  }

  String? knownFor(List<KnownFor> list) {
    String result = list.map((e) => e.title).join(', ');
    return result;
  }

  paginationFun() {
    printDone('CAAAAAAAAAAAAAAAL');
    if (isLoading == false && currentPage < lastPage) {
      isLoading = true;
      currentPage++;
      emit(PaginationState());
      getPopularPeopleList();
    }
  }
}
