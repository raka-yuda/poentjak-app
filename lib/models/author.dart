class Author {
  int id;
  String nameAuthor;
  String imgAuthor;

  Author({this.id, this.nameAuthor, this.imgAuthor});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAuthor = json['name_author'];
    imgAuthor = json['img_author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_author'] = this.nameAuthor;
    data['img_author'] = this.imgAuthor;
    return data;
  }
}
