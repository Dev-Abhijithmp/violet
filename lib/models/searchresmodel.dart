class Searchres {
  Searchres({
    this.displayName,
    this.id,
    this.type,
  });

  String? displayName;
  int? id;
  String? type;

  factory Searchres.fromJson(Map<String, dynamic> json) => Searchres(
        displayName: json["displayName"],
        id: int.parse(json["id"].toString()),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "displayName": displayName,
        "id": id,
        "type": type,
      };
}
