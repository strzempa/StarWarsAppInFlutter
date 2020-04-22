
class Starships {
    int count;
    String next;
    dynamic previous;
    List<Result> results;

    Starships({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    factory Starships.fromJson(Map<String, dynamic> json) => Starships(
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
    String model;
    String manufacturer;
    String costInCredits;
    String length;
    String maxAtmospheringSpeed;
    String crew;
    String passengers;
    String cargoCapacity;
    String consumables;
    String hyperdriveRating;
    String mglt;
    String starshipClass;
    List<String> pilots;
    List<String> films;
    DateTime created;
    DateTime edited;
    String url;

    Result({
        this.name,
        this.model,
        this.manufacturer,
        this.costInCredits,
        this.length,
        this.maxAtmospheringSpeed,
        this.crew,
        this.passengers,
        this.cargoCapacity,
        this.consumables,
        this.hyperdriveRating,
        this.mglt,
        this.starshipClass,
        this.pilots,
        this.films,
        this.created,
        this.edited,
        this.url,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"] == null ? null : json["name"],
        model: json["model"] == null ? null : json["model"],
        manufacturer: json["manufacturer"] == null ? null : json["manufacturer"],
        costInCredits: json["cost_in_credits"] == null ? null : json["cost_in_credits"],
        length: json["length"] == null ? null : json["length"],
        maxAtmospheringSpeed: json["max_atmosphering_speed"] == null ? null : json["max_atmosphering_speed"],
        crew: json["crew"] == null ? null : json["crew"],
        passengers: json["passengers"] == null ? null : json["passengers"],
        cargoCapacity: json["cargo_capacity"] == null ? null : json["cargo_capacity"],
        consumables: json["consumables"] == null ? null : json["consumables"],
        hyperdriveRating: json["hyperdrive_rating"] == null ? null : json["hyperdrive_rating"],
        mglt: json["MGLT"] == null ? null : json["MGLT"],
        starshipClass: json["starship_class"] == null ? null : json["starship_class"],
        pilots: json["pilots"] == null ? null : List<String>.from(json["pilots"].map((x) => x)),
        films: json["films"] == null ? null : List<String>.from(json["films"].map((x) => x)),
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        edited: json["edited"] == null ? null : DateTime.parse(json["edited"]),
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "model": model == null ? null : model,
        "manufacturer": manufacturer == null ? null : manufacturer,
        "cost_in_credits": costInCredits == null ? null : costInCredits,
        "length": length == null ? null : length,
        "max_atmosphering_speed": maxAtmospheringSpeed == null ? null : maxAtmospheringSpeed,
        "crew": crew == null ? null : crew,
        "passengers": passengers == null ? null : passengers,
        "cargo_capacity": cargoCapacity == null ? null : cargoCapacity,
        "consumables": consumables == null ? null : consumables,
        "hyperdrive_rating": hyperdriveRating == null ? null : hyperdriveRating,
        "MGLT": mglt == null ? null : mglt,
        "starship_class": starshipClass == null ? null : starshipClass,
        "pilots": pilots == null ? null : List<dynamic>.from(pilots.map((x) => x)),
        "films": films == null ? null : List<dynamic>.from(films.map((x) => x)),
        "created": created == null ? null : created.toIso8601String(),
        "edited": edited == null ? null : edited.toIso8601String(),
        "url": url == null ? null : url,
    };
}
