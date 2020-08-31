class Anime {
  String name;
  DateTime releaseDate;
  double score;
  int episodes;
  String imageUrl;
  String synopsis;

  Anime({
    this.name,
    this.releaseDate,
    this.score,
    this.episodes,
    this.imageUrl,
    this.synopsis
  });

  @override
  String toString() {
    return 'Name: $name, Date: $releaseDate, Score: $score, Episodes: $episodes\n';
  }

}