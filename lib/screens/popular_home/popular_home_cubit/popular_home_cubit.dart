import 'package:assignment/cache/app_cache.dart';
import 'package:assignment/models/popular_people_model.dart';
import 'package:assignment/screens/popular_home/popular_home_cubit/popular_people_state.dart';
import 'package:assignment/repositories/popular_people_repo.dart';
import 'package:assignment/utils/app_debug_prints.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularPeopleCubit extends Cubit<PopularState> {
  PopularPeopleCubit() : super(PopularInitialState()) {
    _init();
  }

  static PopularPeopleCubit get(context) => BlocProvider.of(context);

  PopularPeopleModel? responseGetPopularList;
  PopularPeopleRepo popularRepo = PopularPeopleRepo();
  String lang = 'en-US';

  List<Results> allPeople = [];
  final ScrollController scrollController = ScrollController();
  int currentPage = 1;
  int lastPage = 1;
  bool isLoading = false;

  // for connectivity
  final Connectivity _connectivity = Connectivity();

  Future<void> _init() async {
    printWarning('IN INIT');
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _updateConnectivityState(result);
    });

    await _checkConnectivity();
  }

  Future<void> _checkConnectivity() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    _updateConnectivityState(result);
  }

  void _updateConnectivityState(ConnectivityResult result) {
    printWarning('_updateConnectivityState');
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      printDone('CONNECTED');
      emit(Connected());
      getPopularPeopleList();
    } else {
      allPeople = AppCache.instance.getPopularList() != null
          ? AppCache.instance.getPopularList()!.results!
          : [];
      printError('DIS CONNECTED');
      emit(Disconnected());
    }
  }

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
    printWarning('IN OAGINATON FUNC');
    if (isLoading == false && currentPage < lastPage) {
      isLoading = true;
      currentPage++;
      emit(PaginationState());
      getPopularPeopleList();
    }
  }
}
