class Species {
    int count;
    String next;
    dynamic previous;
    List<Result> results;

    Species({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    factory Species.fromJson(Map<String, dynamic> json) => Species(
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
    String classification;
    Designation designation;
    String averageHeight;
    String skinColors;
    String hairColors;
    String eyeColors;
    String averageLifespan;
    String homeworld;
    String language;
    List<String> people;
    List<String> films;
    DateTime created;
    DateTime edited;
    String url;

    Result({
        this.name,
        this.classification,
        this.designation,
        this.averageHeight,
        this.skinColors,
        this.hairColors,
        this.eyeColors,
        this.averageLifespan,
        this.homeworld,
        this.language,
        this.people,
        this.films,
        this.created,
        this.edited,
        this.url,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"] == null ? null : json["name"],
        classification: json["classification"] == null ? null : json["classification"],
        designation: json["designation"] == null ? null : designationValues.map[json["designation"]],
        averageHeight: json["average_height"] == null ? null : json["average_height"],
        skinColors: json["skin_colors"] == null ? null : json["skin_colors"],
        hairColors: json["hair_colors"] == null ? null : json["hair_colors"],
        eyeColors: json["eye_colors"] == null ? null : json["eye_colors"],
        averageLifespan: json["average_lifespan"] == null ? null : json["average_lifespan"],
        homeworld: json["homeworld"] == null ? null : json["homeworld"],
        language: json["language"] == null ? null : json["language"],
        people: json["people"] == null ? null : List<String>.from(json["people"].map((x) => x)),
        films: json["films"] == null ? null : List<String>.from(json["films"].map((x) => x)),
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        edited: json["edited"] == null ? null : DateTime.parse(json["edited"]),
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "classification": classification == null ? null : classification,
        "designation": designation == null ? null : designationValues.reverse[designation],
        "average_height": averageHeight == null ? null : averageHeight,
        "skin_colors": skinColors == null ? null : skinColors,
        "hair_colors": hairColors == null ? null : hairColors,
        "eye_colors": eyeColors == null ? null : eyeColors,
        "average_lifespan": averageLifespan == null ? null : averageLifespan,
        "homeworld": homeworld == null ? null : homeworld,
        "language": language == null ? null : language,
        "people": people == null ? null : List<dynamic>.from(people.map((x) => x)),
        "films": films == null ? null : List<dynamic>.from(films.map((x) => x)),
        "created": created == null ? null : created.toIso8601String(),
        "edited": edited == null ? null : edited.toIso8601String(),
        "url": url == null ? null : url,
    };
}

enum Designation { SENTIENT, REPTILIAN }

final designationValues = EnumValues({
    "reptilian": Designation.REPTILIAN,
    "sentient": Designation.SENTIENT
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
