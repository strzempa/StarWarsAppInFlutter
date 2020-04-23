class Films {
    int count;
    dynamic next;
    dynamic previous;
    List<Result> results;

    Films({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    factory Films.fromJson(Map<String, dynamic> json) => Films(
        count: json["count"] == null ? null : json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count == null ? null : count,
        "next": next,
        "previous": previous,
        "results": results == null ? null : List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    String title;
    int episodeId;
    String openingCrawl;
    String director;
    String producer;
    DateTime releaseDate;
    List<String> characters;
    List<String> planets;
    List<String> starships;
    List<String> vehicles;
    List<String> species;
    DateTime created;
    DateTime edited;
    String url;

    Result({
        this.title,
        this.episodeId,
        this.openingCrawl,
        this.director,
        this.producer,
        this.releaseDate,
        this.characters,
        this.planets,
        this.starships,
        this.vehicles,
        this.species,
        this.created,
        this.edited,
        this.url,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"] == null ? null : json["title"],
        episodeId: json["episode_id"] == null ? null : json["episode_id"],
        openingCrawl: json["opening_crawl"] == null ? null : json["opening_crawl"],
        director: json["director"] == null ? null : json["director"],
        producer: json["producer"] == null ? null : json["producer"],
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        characters: json["characters"] == null ? null : List<String>.from(json["characters"].map((x) => x)),
        planets: json["planets"] == null ? null : List<String>.from(json["planets"].map((x) => x)),
        starships: json["starships"] == null ? null : List<String>.from(json["starships"].map((x) => x)),
        vehicles: json["vehicles"] == null ? null : List<String>.from(json["vehicles"].map((x) => x)),
        species: json["species"] == null ? null : List<String>.from(json["species"].map((x) => x)),
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        edited: json["edited"] == null ? null : DateTime.parse(json["edited"]),
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "episode_id": episodeId == null ? null : episodeId,
        "opening_crawl": openingCrawl == null ? null : openingCrawl,
        "director": director == null ? null : director,
        "producer": producer == null ? null : producer,
        "release_date": releaseDate == null ? null : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "characters": characters == null ? null : List<dynamic>.from(characters.map((x) => x)),
        "planets": planets == null ? null : List<dynamic>.from(planets.map((x) => x)),
        "starships": starships == null ? null : List<dynamic>.from(starships.map((x) => x)),
        "vehicles": vehicles == null ? null : List<dynamic>.from(vehicles.map((x) => x)),
        "species": species == null ? null : List<dynamic>.from(species.map((x) => x)),
        "created": created == null ? null : created.toIso8601String(),
        "edited": edited == null ? null : edited.toIso8601String(),
        "url": url == null ? null : url,
    };
}
