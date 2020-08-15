class TrackListDto {
  int totalCount;
  List<Items> items;

  TrackListDto({this.totalCount, this.items});

  TrackListDto.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String id;
  String updatedAt;
  String createdAt;
  String title;
  String description;
  dynamic thumbnailUrl;

  Items(
      {this.id,
      this.updatedAt,
      this.createdAt,
      this.title,
      this.description,
      this.thumbnailUrl});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
    title = json['title'];
    description = json['description'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    data['title'] = this.title;
    data['description'] = this.description;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}
