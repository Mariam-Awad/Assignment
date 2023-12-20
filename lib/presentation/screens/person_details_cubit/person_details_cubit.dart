import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'person_details_state.dart';

class PersonDetailsCubitCubit extends Cubit<PersonDetailsCubitState> {
  PersonDetailsCubitCubit() : super(PersonDetailsCubitInitial());
}
