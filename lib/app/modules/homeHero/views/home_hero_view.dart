import 'package:coast/coast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:marcopolo/app/modules/animatedHome/controllers/animated_home_controller.dart';
import 'package:marcopolo/app/theme/AppColors.dart';
import 'package:marcopolo/app/theme/TextTheme.dart';
import '../controllers/home_hero_controller.dart';

class HomeHeroView extends GetView<HomeHeroController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (c, v) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              forceElevated: v,
              leading: Container(),
              elevation: 0,
              pinned: false,
              // stretch: true,
              expandedHeight: 150.0,
              // snap: true,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Obx(
                    () => Crab(
                      tag: controller.animatedHomeController.heroTag.value,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            child: Image.asset(
                              controller.animatedHomeController.selectedImg,
                              // '',
                              fit: BoxFit.fitWidth,
                            ),
                            height: 150,
                          ),
                          Container(
                            width: double.infinity,
                            color: Colors.black.withOpacity(0.2),
                            height: 150,
                          ),
                          Center(
                            child: Row(
                              // mainAxisAlignment:
                              //     MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Entypo.chevron_left,
                                    color: Colors.white,
                                    size: 37,
                                  ),
                                  onPressed: () {
                                    // controller.secondPage.value = false;
                                    print(controller
                                        .animatedHomeController.heroTag.value);
                                    Get.find<AnimatedHomeController>()
                                        .secondPage
                                        .value = false;
                                    Get.find<AnimatedHomeController>()
                                        .controller
                                        .reverse();
                                    controller.homeController.coastController
                                        .animateTo(
                                            beach: 0,
                                            duration:
                                                Duration(milliseconds: 200),
                                            curve: Curves.easeInOut);
                                  },
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Text(
                                  // '',
                                  controller
                                      .animatedHomeController.selectedText,
                                  style: AppTextTheme.largBText(),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Icon(
                                  Entypo.chevron_left,
                                  color: Colors.white.withOpacity(0),
                                  size: 37,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverAppBar(
              backgroundColor: Colors.white,
              forceElevated: v,
              leading: Container(),
              elevation: 0,
              pinned: true,
              // stretch: true,
              expandedHeight: 55.0,
              // snap: true,
              floating: true,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hotels near you:',
                        style: AppTextTheme.normalBText(),
                      ),
                      Container(
                        height: 50,
                        width: 120,
                        child: Obx(
                          () => DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                            isExpanded: true,
                            value: controller.dropdownValue.value,
                            icon: Icon(
                              Entypo.chevron_down,
                              size: 15,
                              color: AppColors.pink,
                            ),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.black),
                            onChanged: (String newValue) {
                              controller.dropdownValue.value = newValue;
                            },
                            items: controller.droplist
                                .map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text('sot by: $value',
                                      style: AppTextTheme.normalBText()
                                          .copyWith(color: AppColors.pink)),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ];
        }

        ,
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ItemCards(),
            ItemCards(),
            ItemCards(),
            ItemCards(),
            ItemCards(),
            ItemCards(),
            ItemCards(),
            ItemCards(),
          ],
        ),
      ),
    );
  }
}

class ItemCards extends StatelessWidget {
  final String photoUrl;
  final Map<String, dynamic> description;
  // final
  const ItemCards({
    this.photoUrl,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Card(
          elevation: 0,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/3.jpg',
                  height: 110,
                  width: 110,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 110,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Serena',
                        style: AppTextTheme.normalBText()
                            .copyWith(color: Colors.black),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'City: Kabul',
                            // style: AppTextTheme.normalBText()
                            //     .copyWith(color: Colors.black),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Stars: 4',
                            // style: AppTextTheme.normalBText()
                            //     .copyWith(color: Colors.black),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Price: >\$50',
                            // style: AppTextTheme.normalBText()
                            //     .copyWith(color: Colors.black),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Status: Available',
                            // style: AppTextTheme.normalBText()
                            //     .copyWith(color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Entypo.chevron_right,
                  color: Colors.black,
                  size: 37,
                ),
                onPressed: null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
