class PopularPeopleModel {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  PopularPeopleModel({page, results, totalPages, totalResults});

  PopularPeopleModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}

class Results {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  List<KnownFor>? knownFor;

  Results(
      {adult,
      gender,
      id,
      knownForDepartment,
      name,
      originalName,
      popularity,
      profilePath,
      knownFor});

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'] ?? false;
    gender = json['gender'] ?? 1;
    id = json['id'] ?? 1;
    knownForDepartment = json['known_for_department'] ?? '';
    name = json['name'] ?? '';
    originalName = json['original_name'] ?? '';
    popularity = json['popularity'] ?? 0.0;
    profilePath = json['profile_path'] ?? '';
    if (json['known_for'] != null) {
      knownFor = <KnownFor>[];
      json['known_for'].forEach((v) {
        knownFor!.add(KnownFor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['adult'] = adult;
    data['gender'] = gender;
    data['id'] = id;
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    data['original_name'] = originalName;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    if (knownFor != null) {
      data['known_for'] = knownFor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class KnownFor {
  bool? adult;
  String? backdropPath;
  int? id;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  List<int>? genreIds;
  double? popularity;
  String? releaseDate;
  bool? video;
  double? voteAverage;
  int? voteCount;
  String? name;
  String? originalName;
  String? firstAirDate;
  List<String>? originCountry;

  KnownFor(
      {adult,
      backdropPath,
      id,
      title,
      originalLanguage,
      originalTitle,
      overview,
      posterPath,
      mediaType,
      genreIds,
      popularity,
      releaseDate,
      video,
      voteAverage,
      voteCount,
      name,
      originalName,
      firstAirDate,
      originCountry});

  KnownFor.fromJson(Map<String, dynamic> json) {
    adult = json['adult'] ?? false;
    backdropPath = json['backdrop_path'] ?? '';
    id = json['id'] ?? 1;
    title = json['title'] ?? '';
    originalLanguage = json['original_language'] ?? '';
    originalTitle = json['original_title'] ?? '';
    overview = json['overview'] ?? '';
    posterPath = json['poster_path'] ?? '';
    mediaType = json['media_type'] ?? '';
    genreIds = json['genre_ids'] == null ? [] : List<int>.from(json["genre_ids"].map((x) => x));
    popularity = json['popularity'] ?? 0.0;
    releaseDate = json['release_date'] ?? '';
    video = json['video'] ?? false;
    voteAverage = json['vote_average'] ?? 0.0;
    voteCount = json['vote_count'] ?? 1;
    name = json['name'] ?? '';
    originalName = json['original_name'] ?? '';
    firstAirDate = json['first_air_date'] ?? '';
    originCountry = json['origin_country'] == null ? [] : List<String>.from(json["origin_country"].map((x) => x));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['title'] = title;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['media_type'] = mediaType;
    data['genre_ids'] = genreIds;
    data['popularity'] = popularity;
    data['release_date'] = releaseDate;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    data['name'] = name;
    data['original_name'] = originalName;
    data['first_air_date'] = firstAirDate;
    data['origin_country'] = originCountry;
    return data;
  }
}
