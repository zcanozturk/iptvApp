import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../model/home_model.dart';

class HomeViewModel extends GetxController {
  HomeViewModel();

  var counter = 0.obs;
  var isLoading = false.obs;
  var homeList = <HomeModel>[].obs;
  

  void increaseCounter() => counter++;

  void changeLoading() {
    isLoading.value = !isLoading.value;
  }

  Future<void> getHomeItems() async {
    changeLoading();

    

    changeLoading();
  }
}
