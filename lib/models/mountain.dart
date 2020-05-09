class Mountain {
  int id;
  String nameMt;
  String imgMt;
  String location;

  Mountain({this.id, this.nameMt, this.imgMt, this.location});

  Mountain.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameMt = json['name_mt'];
    imgMt = json['img_mt'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_mt'] = this.nameMt;
    data['img_mt'] = this.imgMt;
    data['location'] = this.location;
    return data;
  }
}
