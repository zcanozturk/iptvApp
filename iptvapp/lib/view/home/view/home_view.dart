import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../model/home_model.dart';
import '../viewmodel/home_view_model.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final ctrl = Get.put(HomeViewModel());
  initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // executes after build
      ctrl.getHomeItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    // ctrl.getHomeItems();
    initState();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'sun',
        backgroundColor: Colors.blue,
        child: Icon(Icons.wb_sunny_outlined),
        onPressed: () {
          Get.to(HomeView());
          ctrl.increaseCounter();
          Get.snackbar(
              'Click Action', 'You have clicked ${ctrl.counter.value} times ',
              backgroundColor: Colors.green, colorText: Colors.white);
        },
      ),
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          ElevatedButton(
              onPressed: () {
                ctrl.counter.value = 0;
                Get.snackbar('DELETED', 'You have cleared counter !',
                    colorText: Colors.white, backgroundColor: Colors.green);
              },
              child: Icon(Icons.clear))
        ],
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text('Home'),
      ),
      body: getObservableBody(context),
    );
  }

  getObservableBody(BuildContext context) {
    return Obx(
        () => ctrl.isLoading.value ? buildCenterLoading() : buildListBuilder());
  }

  buildCenterLoading() => Center(
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          backgroundColor: Colors.grey,
        ),
      );

  buildListBuilder() {
    var refreshKey = GlobalKey<RefreshIndicatorState>();
    return Container(
        // if there is another thing above or below list yo should make this expanded to fit .
        color: Colors.black,
        alignment: Alignment.center,
        height: Get.height,
        child: ctrl.joblist.isEmpty
            ? RefreshIndicator(
                onRefresh: () async {
                  await ctrl.getHomeItems();
                },
                child: Stack(
                  children: <Widget>[
                    ListView(),
                    Center(
                      child: Text(
                        'no title',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              )
            : RefreshIndicator(
                key: refreshKey,
                onRefresh: () async {
                  await ctrl.getHomeItems();
                },
                child: Scrollbar(
                  interactive: true,
                  thumbVisibility: true,
                  radius: Radius.circular(50),
                  thickness: Get.width * 0.02,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: ctrl.joblist.length,
                      itemBuilder: (context, index) {
                        var model = ctrl.joblist[index];
                        return getCardListWidget(context, model);
                      }),
                ),
              ));
  }

  Widget getCardListWidget(BuildContext context, HomeModel model) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            onTap: () async {
              //Get.to(SomeView());
            },
            leading: Icon(
              Icons.wb_sunny,
              color: Colors.blue,
            ),
            title: AutoSizeText(
              model.customerip ?? '',
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
