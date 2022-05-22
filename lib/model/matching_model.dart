class MatchingInfo {
  String name;
  String mood;
  String description;
  MatchingInfo(this.name, this.mood, this.description);

  MatchingInfo.fromMap(Map map)
      : name = map['name'],
        description = map['description'],
        mood = map['mood'];

  Map toMap() {
    return {'name': name, 'description': description, 'mood': mood};
  }
}
