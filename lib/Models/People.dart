class People {
    int count;
    String next;
    dynamic previous;
    List<Result> results;

    People({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    factory People.fromJson(Map<String, dynamic> json) => People(
        count: json["count"] == null ? null : json["count"],
        next: json["next"] == null ? null : json["next"],
        previous: json["previous"],
        results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count == null ? null : count,
        "next": next == null ? null : next,
        "previous": previous,
        "results": results == null ? null : List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    String name;
    String height;
    String mass;
    String hairColor;
    String skinColor;
    String eyeColor;
    String birthYear;
    Gender gender;
    String homeworld;
    List<String> films;
    List<String> species;
    List<String> vehicles;
    List<String> starships;
    DateTime created;
    DateTime edited;
    String url;

    Result({
        this.name,
        this.height,
        this.mass,
        this.hairColor,
        this.skinColor,
        this.eyeColor,
        this.birthYear,
        this.gender,
        this.homeworld,
        this.films,
        this.species,
        this.vehicles,
        this.starships,
        this.created,
        this.edited,
        this.url,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"] == null ? null : json["name"],
        height: json["height"] == null ? null : json["height"],
        mass: json["mass"] == null ? null : json["mass"],
        hairColor: json["hair_color"] == null ? null : json["hair_color"],
        skinColor: json["skin_color"] == null ? null : json["skin_color"],
        eyeColor: json["eye_color"] == null ? null : json["eye_color"],
        birthYear: json["birth_year"] == null ? null : json["birth_year"],
        gender: json["gender"] == null ? null : genderValues.map[json["gender"]],
        homeworld: json["homeworld"] == null ? null : json["homeworld"],
        films: json["films"] == null ? null : List<String>.from(json["films"].map((x) => x)),
        species: json["species"] == null ? null : List<String>.from(json["species"].map((x) => x)),
        vehicles: json["vehicles"] == null ? null : List<String>.from(json["vehicles"].map((x) => x)),
        starships: json["starships"] == null ? null : List<String>.from(json["starships"].map((x) => x)),
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        edited: json["edited"] == null ? null : DateTime.parse(json["edited"]),
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "height": height == null ? null : height,
        "mass": mass == null ? null : mass,
        "hair_color": hairColor == null ? null : hairColor,
        "skin_color": skinColor == null ? null : skinColor,
        "eye_color": eyeColor == null ? null : eyeColor,
        "birth_year": birthYear == null ? null : birthYear,
        "gender": gender == null ? null : genderValues.reverse[gender],
        "homeworld": homeworld == null ? null : homeworld,
        "films": films == null ? null : List<dynamic>.from(films.map((x) => x)),
        "species": species == null ? null : List<dynamic>.from(species.map((x) => x)),
        "vehicles": vehicles == null ? null : List<dynamic>.from(vehicles.map((x) => x)),
        "starships": starships == null ? null : List<dynamic>.from(starships.map((x) => x)),
        "created": created == null ? null : created.toIso8601String(),
        "edited": edited == null ? null : edited.toIso8601String(),
        "url": url == null ? null : url,
    };
}

enum Gender { MALE, N_A, FEMALE }

final genderValues = EnumValues({
    "female": Gender.FEMALE,
    "male": Gender.MALE,
    "n/a": Gender.N_A
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
