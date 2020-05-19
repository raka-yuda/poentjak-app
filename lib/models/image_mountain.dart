class ImageMountain {
  int id;
  String imgMt;
  int idMountain;

  ImageMountain({this.id, this.imgMt, this.idMountain});

  ImageMountain.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgMt = json['img_mt'];
    idMountain = json['id_mountain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img_mt'] = this.imgMt;
    data['id_mountain'] = this.idMountain;
    return data;
  }
}
