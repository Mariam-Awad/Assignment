abstract class PersonDetailsState {}

// For Details Request
class PersonDetailsInitialState extends PersonDetailsState {}

class PersonDetailsLoadingState extends PersonDetailsState {}

class PersonDetailsSuccessState extends PersonDetailsState {}

class PersonDetailsErrorState extends PersonDetailsState {}

// For Images Request
class PersonImagesLoadingState extends PersonDetailsState {}

class PersonImagesSuccessState extends PersonDetailsState {}

class PersonImagesErrorState extends PersonDetailsState {}
