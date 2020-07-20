import 'package:json_annotation/json_annotation.dart';

part 'mountains.g.dart';

@JsonSerializable()
class Mountains {
  List<Mountain> mountains;
  @JsonKey(ignore: true)
  String error;

  Mountains(this.mountains);

  factory Mountains.fromJson(Map<String, dynamic> json) =>
      _$MountainsFromJson(json);

  Mountains.withError(this.error);

  Map<String, dynamic> toJson() => _$MountainsToJson(this);

  @override
  String toString() {
    return 'Mountains{mountains: $mountains}';
  }
}

@JsonSerializable()
class Mountain {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name_mt")
  String nameMt;
  @JsonKey(name: "img_mt")
  String imgMt;
  @JsonKey(name: "location")
  String location;
  @JsonKey(name: "image_mountain")
  List<ImageMountain> imageMountain;
  @JsonKey(name: "post_mountain")
  List<PostMountain> postMountain;

  Mountain(
      {this.id, this.nameMt, this.imgMt, this.location, this.imageMountain});

  @override
  String toString() {
    return 'Mountain{id :$id, nameMt :$nameMt ,imgMt :$imgMt ,location :$location ,imageMountain :$imageMountain , postMountain : $postMountain}';
  }

  factory Mountain.fromJson(Map<String, dynamic> json) =>
      _$MountainFromJson(json);

  Map<String, dynamic> toJson() => _$MountainToJson(this);
}

@JsonSerializable()
class ImageMountain {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "img_mt")
  String imgMt;
  @JsonKey(name: "id_mountain")
  int idMt;

  ImageMountain({this.id, this.imgMt, this.idMt});

  @override
  String toString() {
    return 'ImageMountain{id :$id ,imgMt :$imgMt ,idMountain : $idMt}';
  }

  factory ImageMountain.fromJson(Map<String, dynamic> json) =>
      _$ImageMountainFromJson(json);

  Map<String, dynamic> toJson() => _$ImageMountainToJson(this);
}

@JsonSerializable()
class PostMountain {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "post_name")
  String postName;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "id_mountain")
  int idMt;

  PostMountain({this.id, this.postName, this.description, this.idMt});

  @override
  String toString() {
    return 'PostMountain{id :$id ,postName :$postName , description: $description ,idMountain : $idMt}';
  }

  factory PostMountain.fromJson(Map<String, dynamic> json) =>
      _$PostMountainFromJson(json);

  Map<String, dynamic> toJson() => _$PostMountainToJson(this);
}
