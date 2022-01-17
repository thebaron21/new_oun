class TrackEntity {
  final String numberTrack;
  final String to;
  final String stateTrack;
  final String location;
  final String dateRecive;
  final String timeRecive;
  final String username;
  TrackEntity(
      {this.numberTrack,
      this.to,
      this.stateTrack,
      this.location,
      this.dateRecive,
      this.timeRecive,
      this.username});

  TrackEntity.fromMap(Map<String, dynamic> json)
      : numberTrack = json["numberTrack"],
        to = json["to"],
        stateTrack = json["stateTrack"],
        location = json["location"],
        dateRecive = json["dateRecive"],
        timeRecive = json["timeRecive"],
        username = json["username"];
}
