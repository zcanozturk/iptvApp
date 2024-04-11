import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../model/home_model.dart';

class HomeViewModel extends GetxController {
  HomeViewModel();

  var counter = 0.obs;
  var isLoading = false.obs;
  var homeList = <HomeModel>[].obs;
  var joblist = <HomeModel>[].obs;
  List mylist = [].obs;
  List jobdays = [].obs;

  void increaseCounter() => counter++;

  void changeLoading() {
    isLoading.value = !isLoading.value;
  }

  Future<void> getHomeItems() async {
    changeLoading();
    final String localJsonPath = 'assets/customers/customers.json';

    final String response = await rootBundle.loadString(localJsonPath);
    var data = await json.decode(response);
    mylist = data["data"];
    joblist.value = mylist.map((user) => HomeModel.fromJson(user)).toList();

    print(joblist.first.id);

    changeLoading();
  }
}
