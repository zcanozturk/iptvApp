import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  int? id;
  String? customername;
  String? customersurname;
  String? customerip;
  List<Tracks>? tracks;

  HomeModel(
      {this.id,
      this.customername,
      this.customersurname,
      this.customerip,
      this.tracks});

  HomeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customername = json['customername'];
    customersurname = json['customersurname'];
    customerip = json['customerip'];
    if (json['tracks'] != null) {
      tracks = <Tracks>[];
      json['tracks'].forEach((v) {
        tracks!.add(new Tracks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customername'] = this.customername;
    data['customersurname'] = this.customersurname;
    data['customerip'] = this.customerip;
    if (this.tracks != null) {
      data['tracks'] = this.tracks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tracks {
  int? trackid;
  String? date;
  int? price;

  Tracks({this.trackid, this.date, this.price});

  Tracks.fromJson(Map<String, dynamic> json) {
    trackid = json['trackid'];
    date = json['date'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trackid'] = this.trackid;
    data['date'] = this.date;
    data['price'] = this.price;
    return data;
  }
}