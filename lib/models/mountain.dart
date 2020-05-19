import './image_mountain.dart';

class Mountain {
  int id;
  String nameMt;
  String imgMt;
  String location;
  List<ImageMountain> imageMountain;

  Mountain(
      {this.id, this.nameMt, this.imgMt, this.location, this.imageMountain});

  Mountain.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameMt = json['name_mt'];
    imgMt = json['img_mt'];
    location = json['location'];
    if (json['image_mountain'] != null) {
      imageMountain = new List<ImageMountain>();
      json['image_mountain'].forEach((v) {
        imageMountain.add(new ImageMountain.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_mt'] = this.nameMt;
    data['img_mt'] = this.imgMt;
    data['location'] = this.location;
    if (this.imageMountain != null) {
      data['image_mountain'] =
          this.imageMountain.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
