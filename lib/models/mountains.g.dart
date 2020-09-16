// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mountains.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mountains _$MountainsFromJson(Map<String, dynamic> json) {
  return Mountains(
    (json['mountains'] as List)
        ?.map((e) =>
            e == null ? null : Mountain.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MountainsToJson(Mountains instance) => <String, dynamic>{
      'mountains': instance.listMountains,
    };

Mountain _$MountainFromJson(Map<String, dynamic> json) {
  return Mountain(
    id: json['id'] as int,
    nameMt: json['name_mt'] as String,
    imgMt: json['img_mt'] as String,
    location: json['location'] as String,
    imageMountain: (json['image_mountain'] as List)
        ?.map((e) => e == null
            ? null
            : ImageMountain.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    postMountain: (json['post_mountain'] as List)
        ?.map((e) =>
            e == null ? null : PostMountain.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MountainToJson(Mountain instance) => <String, dynamic>{
      'id': instance.id,
      'name_mt': instance.nameMt,
      'img_mt': instance.imgMt,
      'location': instance.location,
      'image_mountain': instance.imageMountain,
      'post_mountain': instance.postMountain,
    };

ImageMountain _$ImageMountainFromJson(Map<String, dynamic> json) {
  return ImageMountain(
    id: json['id'] as int,
    imgMt: json['img_mt'] as String,
    idMt: json['id_mountain'] as int,
  );
}

Map<String, dynamic> _$ImageMountainToJson(ImageMountain instance) =>
    <String, dynamic>{
      'id': instance.id,
      'img_mt': instance.imgMt,
      'id_mountain': instance.idMt,
    };

PostMountain _$PostMountainFromJson(Map<String, dynamic> json) {
  return PostMountain(
    id: json['id'] as int,
    postName: json['post_name'] as String,
    description: json['description'] as String,
    idMt: json['id_mountain'] as int,
  );
}

Map<String, dynamic> _$PostMountainToJson(PostMountain instance) =>
    <String, dynamic>{
      'id': instance.id,
      'post_name': instance.postName,
      'description': instance.description,
      'id_mountain': instance.idMt,
    };
