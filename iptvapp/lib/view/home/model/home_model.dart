import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel  {
  int? userId;
  int? id;
  String? title;
  String? body;

  HomeModel({this.userId, this.id, this.title, this.body});

  @override
  HomeModel fromJson(Map<String, dynamic> json) {
    return _$HomeModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$HomeModelToJson(this);
  }
}
